package _sprite{
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
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.net.URLRequest;
 
	import jp.progression.commands.lists.LoaderList;
	import jp.progression.commands.net.LoadBitmapData;
	
	import flash.utils.Timer;
    import flash.events.TimerEvent;
	
	/**
	 * ...
	 * @author ...
	 */
	public class bg_Image_Sprite extends CastSprite {
		
		/**
		 * 新しい MyCastSprite インスタンスを作成します。
		 */
		private var _imageUrl:String;
		private var _sceneId:SceneId;
		private var _obj:Object;
		private var _load_X:uint;
		private var _load_Y:uint;
		private var _load_Width:uint;
		private var _load_Height:uint;
		private var _nodeNum:uint;
		//public var timer:Timer = new Timer(3000 ); // 1000ミリ秒 = １秒
		private var display:DisplayObject;
		
		public function bg_Image_Sprite( initObject:Object = null ) {
			// 親クラスを初期化します。
			super( initObject );
		}
		
		public function set sceneId(value:SceneId):void 
		{
			//シーンIDはsetterで取得
			_sceneId = value;
			
		}	
		
		public function set imageUrl(value:String):void 
		{
			_imageUrl = value;
		}
		
		public function set load_X(value:uint):void 
		{
			_load_X = value;
			
		}
		
		public function set load_Y(value:uint):void 
		{
			_load_Y = value;
			
		}
		
		public function set load_Width(value:uint):void 
		{
			_load_Width = value;
			
		}
		
		public function set load_Height(value:uint):void 
		{
			_load_Height = value;
			
		}
		
		public function set nodeNum(value:uint):void 
		{
			_nodeNum = value;
			
		}
		/**
		 * IExecutable オブジェクトが AddChild コマンド、または AddChildAt コマンド経由で表示リストに追加された場合に送出されます。
		 * このイベント処理の実行中には、ExecutorObject を使用した非同期処理が行えます。
		 */
		override protected function atCastAdded():void {
			/*//ボタンの作成
			_button = new bg_Btn_Image( { imageUrl:_imageUrl, _X:_load_X, _Y:_load_Y, _Width:_load_Width, _Height:_load_Height } );
			//シーンIDの設定
			_button.sceneId = _sceneId;
			
			
			
			//自身にボタンを追加し、追加時の動作を設定
			addCommand(
				// 任意のコマンドを記述してください。
				new Prop(this, { alpha:0 } ),
				new AddChild(this, _button),
				new DoTweener(this, {x:0, alpha:1, time:0.5 } )
			);*/
			
			if (_imageUrl != null) {
			new LoaderList(
	                          {
		                      onComplete : function ():void {
			                  //trace("complete", this.latestData, this.data);
						      var i:uint = 0;
			                  for each (var bd:BitmapData in this.data) {
							   
				              display = addChild(new Bitmap(bd));
				              i++;
			                  display.x = 0;
							  display.y = 0;
							 
							  //_arr_display.push(display);
							  //display.visible = false;
							  //display.width = 800;
							  //display.height = 70;
							  
							  //display.x = Mekakushi.width/2 - display.width/2  ;
				              
							  
							  }
		                      },
		       onProgress : function ():void  {
			                  //trace( this.percent, "%", this.loaded, "/", this.total, this.bytesLoaded, this.bytesTotal );
		                      },
		       onStart : function ():void {
			                  //trace("start");
		                      }
	                          },
	                          new LoadBitmapData(new URLRequest(_imageUrl))).execute();
				
		                      }
			
		   
		   
		   //trace("今は"+this.sceneId);
		
			
		}
		
		/**
		 * IExecutable オブジェクトが RemoveChild コマンド、または RemoveAllChild コマンド経由で表示リストから削除された場合に送出されます。
		 * このイベント処理の実行中には、ExecutorObject を使用した非同期処理が行えます。
		 */
		override protected function atCastRemoved():void {
			//ボタン削除時の動作を設定
			addCommand(
				// 任意のコマンドを記述してください。
				new DoTweener(this, { x: 300, alpha:0, time:0.5} )
				
			);
		}
	}
}
