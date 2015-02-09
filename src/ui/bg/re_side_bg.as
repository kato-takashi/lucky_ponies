package ui.bg{
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
	import jp.progression.scenes.*;
	import ui.*;
	import _scene.*;
	
	import flash.utils.Timer;
    import flash.events.TimerEvent;
	
	import flash.events.*;
	
	import fl.transitions.*;
    import fl.motion.easing.*;
    import flash.utils.*;
	
	
	/**
	 * ...
	 * @author ...
	 */
	public class re_side_bg extends CastSprite {
		
		/**
		 * 新しい MyCastSprite インスタンスを作成します。
		 */
		 ////////////btn
		 
		
		 
		 
		public function re_side_bg( initObject:Object = null ) {
			// 親クラスを初期化します。
			super( initObject );
			//this.alpha = 0.6;
			this.x=-100;
			this.height = 3000;
			
			
			
			
			
		}
		
		/**
		 * IExecutable オブジェクトが AddChild コマンド、または AddChildAt コマンド経由で表示リストに追加された場合に送出されます。
		 * このイベント処理の実行中には、ExecutorObject を使用した非同期処理が行えます。
		 */
		override protected function atCastAdded():void {
			
						  
								  
			var pList1:ParallelList = new ParallelList();
			pList1.addCommand( 
                       new DoTweener( this , { x:0 , time:.5 , transition:"easeOutCirc" } )
					   
					   );
			
			insertCommand(pList1);
			
			
			
		}
		
		/**
		 * IExecutable オブジェクトが RemoveChild コマンド、または RemoveAllChild コマンド経由で表示リストから削除された場合に送出されます。
		 * このイベント処理の実行中には、ExecutorObject を使用した非同期処理が行えます。
		 */
		override protected function atCastRemoved():void {
		}
	}
}
