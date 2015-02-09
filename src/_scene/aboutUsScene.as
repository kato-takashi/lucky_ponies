package _scene{
	import jp.progression.casts.*;
	import jp.progression.commands.display.*;
	import jp.progression.commands.lists.*;
	import jp.progression.commands.managers.*;
	import jp.progression.commands.media.*;
	import jp.progression.commands.net.*;
	import jp.progression.commands.tweens.*;
	import jp.progression.commands.*;
	import jp.progression.data.*;
	import jp.progression.events.*;
	import jp.progression.executors.*;
	import jp.progression.scenes.*;
	import ui.*;
	import ui.bg.*;
	
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author ...
	 */
	public class aboutUsScene extends SceneObject {
		
		/**
		 * 新しい IndexScene インスタンスを作成します。
		 */
		
		private var _up_bg:up_bg;
		private var _AboutUs_txt:AboutUs_txt;
		private var _xml_nodeNum:uint;
		
		public function aboutUsScene() {
			// シーンタイトルを設定します。
			title = "About Us _ LuckyPonies Web _ Kato & Kato Design.";
		}
		
		/**
		 * シーン移動時に目的地がシーンオブジェクト自身もしくは子階層だった場合に、階層が変更された直後に送出されます。
		 * このイベント処理の実行中には、ExecutorObject を使用した非同期処理が行えます。
		 */
		override protected function atSceneLoad():void {
			
			_up_bg = new up_bg();
			_up_bg.x= IndexScene(parent)._logo_btn.width;
			
			_AboutUs_txt = new AboutUs_txt();
			_AboutUs_txt.y = -800;
			_AboutUs_txt.x = 30;
			_xml_nodeNum = IndexScene(parent).xml_nodeNum ;
			for ( var m:int = 0; m < _xml_nodeNum; m++ ) {
						  //pList2.addCommand(
						  addCommand(   
								   new DoTweener( IndexScene(parent)._arr_Btn_Thumbnail[m] , {  alpha:0 , time:.1 , transition:"easeOutCirc" } ) 
								   );
						  }
		}
		
		/**
		 * シーンオブジェクト自身が目的地だった場合に、到達した瞬間に送出されます。
		 * このイベント処理の実行中には、ExecutorObject を使用した非同期処理が行えます。
		 */
		override protected function atSceneInit():void {
			//IndexScene(parent)._arr_Btn_Thumbnail[0].alpha = 1;
			_xml_nodeNum = IndexScene(parent).xml_nodeNum ;
			//trace("配列の数"+IndexScene(parent)._arr_Btn_Thumbnail.length);
			//trace("配列"+IndexScene(parent)._arr_Btn_Thumbnail);  
			addCommand(
					   new AddChild(container, _up_bg),
					   new AddChild(_up_bg, _AboutUs_txt),
					   [
					   new DoTweener( _AboutUs_txt , {  alpha:1, y:0 , time:.2 , transition:"easeOutCirc" } ),
					   new DoTweener( IndexScene(parent)._arr_Btn_Thumbnail[0] , {  alpha:1 , time:.2 , transition:"easeOutCirc" } ) ]
					  );
						
		}
		
		/**
		 * シーンオブジェクト自身が出発地だった場合に、移動を開始した瞬間に送出されます。
		 * このイベント処理の実行中には、ExecutorObject を使用した非同期処理が行えます。
		 */
		override protected function atSceneGoto():void {
			
			addCommand(
					   [new DoTweener( _AboutUs_txt , {  alpha:0 ,y:-300 , time:.2 , transition:"easeOutCirc" } ),
					   new DoTweener( IndexScene(parent)._arr_Btn_Thumbnail[0] , {  alpha:0 , time:.2 , transition:"easeOutCirc" } )],
					   new RemoveChild(container,_up_bg),
					   new RemoveChild(_up_bg, _AboutUs_txt),
			           new RemoveAllChildren(this)
			);
			
		}
		
		/**
		 * シーン移動時に目的地がシーンオブジェクト自身もしくは親階層だった場合に、階層が変更される直前に送出されます。
		 * このイベント処理の実行中には、ExecutorObject を使用した非同期処理が行えます。
		 */
		override protected function atSceneUnload():void {
			addCommand(
			);
		}
	}
}
