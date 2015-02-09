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
	
	import flash.events.*;
	
	/**
	 * ...
	 * @author ...
	 */
	public class re_up_bg extends CastMovieClip {
		
		/**
		 * 新しい MyCastSprite インスタンスを作成します。
		 */
		  
		public function re_up_bg( initObject:Object = null ) {
			// 親クラスを初期化します。
			super( initObject );
			//this.alpha = 0.7;
			//this.y=-100;
			this.width = 3000;
			
			
																	
			
			
		}
		
		/**
		 * IExecutable オブジェクトが AddChild コマンド、または AddChildAt コマンド経由で表示リストに追加された場合に送出されます。
		 * このイベント処理の実行中には、ExecutorObject を使用した非同期処理が行えます。
		 */
		override protected function atCastAdded():void {
			
			addCommand( 
                       //new DoTweener( this , { y:0 , time:.2 , transition:"easeOutCirc" } ) 
                       ); 
		}
		
		/**
		 * IExecutable オブジェクトが RemoveChild コマンド、または RemoveAllChild コマンド経由で表示リストから削除された場合に送出されます。
		 * このイベント処理の実行中には、ExecutorObject を使用した非同期処理が行えます。
		 */
		override protected function atCastRemoved():void {
			//new DoTweener( this , { y:-100 ,alpha:0 , time:.2 , transition:"easeOutCirc" } ),
			//new RemoveAllChildren(this)
		}
	}
}
