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
	import ui.bg.*;
	import ui.Scroll_bar.*
	import _sprite.*;
	
	import flash.net.*;
	import flash.display.*;
	import flash.text.*;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Link_txt extends CastSprite {
		private var txtSquare:Sprite;
		private var txtField:TextField;
		private var base:Sprite;
		private var masker :Masker;
		private var scrollBar:Scrollbar;
		private var arr_linkURL:Array;
		private var _Btn_linkURL:Btn_linkURL
		
		/**
		 * 新しい MyCastSprite インスタンスを作成します。
		 */
		public function Link_txt( initObject:Object = null ) {
			// 親クラスを初期化します。
			super( initObject );
		}
		
		/**
		 * IExecutable オブジェクトが AddChild コマンド、または AddChildAt コマンド経由で表示リストに追加された場合に送出されます。
		 * このイベント処理の実行中には、ExecutorObject を使用した非同期処理が行えます。
		 */
		override protected function atCastAdded():void {
			
			var _linkURL:String;
			var nameString:String;
			var nodeNum:uint;
			var bmpDataList:Array;
			arr_linkURL = new Array();
			//_Btn_linkURL = new Btn_linkURL();
			addCommand(
					   new LoadURL( new URLRequest( "xml/LinkTxt.xml" ) ),
                      ////////////////
				      ////////////////HTML用
				      
					  function():void {
                      //trace( this.previous.data );
					  var myxml:XML = XML(this.latestData);
					  
					  base = new Sprite ();
					  base.graphics.drawRect(0, 0, 500, 0);
					  base.x=10;
					  base.y=80
					  
					  addChild(base);
					  
					  txtSquare = new Sprite ();
					  txtSquare.graphics.drawRect(0, 0, 500, 0);
					  txtSquare.x=10;
					  //txtSquare.y=80;
					  base.addChild(txtSquare);
					  
					 
					  
					  
					  
					  //XMLノード数取得
					  nodeNum = myxml.child("scene").length();
					  
                      
					  for (var i:uint=0; i< nodeNum; i++){
					 
					  
					  _linkURL = myxml.scene.linkUrl[i];
					  nameString = myxml.scene._txt[i];
					  
					 
					 _Btn_linkURL = new Btn_linkURL( { linkUrl:_linkURL, linkName:nameString } );
					 arr_linkURL.push(_Btn_linkURL);
					 txtSquare.addChild(_Btn_linkURL);
					  
					  _Btn_linkURL.y = 30*i;
					  
					 
					
					//////////
					}
					masker = new Masker();
					//masker.x = txtSquare2.x;
					masker.y = base.y;
					
					masker.width = txtSquare.width;
					masker.height = 300;
				    addChild(masker);
					scrollBar=new Scrollbar(txtSquare,masker);
					scrollBar.x =  txtSquare.x;
					
					//scrollBar.y = 100;
					
					addChild(scrollBar);
					
					
					
					
					
				
			   }
					  				
			);
		}
		
		/**
		 * IExecutable オブジェクトが RemoveChild コマンド、または RemoveAllChild コマンド経由で表示リストから削除された場合に送出されます。
		 * このイベント処理の実行中には、ExecutorObject を使用した非同期処理が行えます。
		 */
		override protected function atCastRemoved():void {
			
			removeChild(base);
			removeChild(scrollBar);
			
			addCommand(
			//new RemoveAllChildren(this)
			);
		}
	}
}
