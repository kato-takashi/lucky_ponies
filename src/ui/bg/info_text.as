﻿package ui.bg{	import jp.progression.casts.*;	import jp.progression.commands.display.*;	import jp.progression.commands.lists.*;	import jp.progression.commands.managers.*;	import jp.progression.commands.media.*;	import jp.progression.commands.net.*;	import jp.progression.commands.tweens.*;	import jp.progression.commands.*;	import jp.progression.data.*;	import jp.progression.events.*;	import jp.progression.scenes.*;		import ui.*;	import ui.bg.*;	import ui.Scroll_bar.*		import flash.net.*;	import flash.display.*;	import flash.text.*;			/**	 * ...	 * @author ...	 */	public class info_text extends CastSprite {		private var txtSquare:Sprite;		private var txtField:TextField;		private var base:Sprite;		private var masker :Masker;		private var scrollBar:Scrollbar;		/**		 * 新しい MyCastSprite インスタンスを作成します。		 */		public function info_text( initObject:Object = null ) {			// 親クラスを初期化します。			super( initObject );		}				/**		 * IExecutable オブジェクトが AddChild コマンド、または AddChildAt コマンド経由で表示リストに追加された場合に送出されます。		 * このイベント処理の実行中には、ExecutorObject を使用した非同期処理が行えます。		 */		override protected function atCastAdded():void {			var dataString:String;			var contentString:String;			var nodeNum:uint;			var bmpDataList:Array;						addCommand(					   new LoadURL( new URLRequest( "xml/TxtData.xml" ) ),                      ////////////////				      ////////////////HTML用				      					  function():void {                      //trace( this.previous.data );					  var myxml:XML = XML(this.latestData);					  					  base = new Sprite ();					  base.graphics.drawRect(0, 0, 500, 0);					  base.x=10;					  base.y=80					  					  addChild(base);					  					  txtSquare = new Sprite ();					  txtSquare.graphics.drawRect(0, 0, 500, 0);					  txtSquare.x=10;					  //txtSquare.y=80;					  base.addChild(txtSquare);					  					  					  					  //XMLノード数取得					  nodeNum = myxml.child("scene").length();                      					  for (var i:uint=0; i< nodeNum; i++){					  txtField = new TextField();					  bmpDataList = new Array();					  /////////////////テキストフォーマット					  var format:TextFormat = new TextFormat();					  format.font = "_ゴシック";		// フォント名                      format.size = 10;		// 文字のポイントサイズ                      format.color = 0x000000;// 文字の色					  					  					  /////////一行目強調					  if (i>0){						  format.color = 0xffffff;						  };			          txtField.wordWrap = true;					  txtField.multiline = true;					  txtField.defaultTextFormat = format;					  					  /////////////////					  					  dataString = myxml.scene.data[i];					  contentString = myxml.scene.content[i]					  //txtField.text = myxml.scene.content[2] ;					  txtField.text = dataString +"    "+ contentString ;					  					  //txtField.text = "test";					  					 txtField.width = txtSquare.width; 					 //txtField.x = 200;			         //txtField.y = 15*i;										 			 //////////////					// ビットマップデータの作成                     var bmpData:BitmapData = new BitmapData(txtField.textWidth+10, txtField.textHeight+10,true, 0x00ffffff);					                      // キャプる                     bmpData.draw(txtField);                     // ペースト                     var bmp:DisplayObject = txtSquare.addChild(new Bitmap(bmpData));					bmp.x = 0;					bmp.y = 30*i;					bmpDataList.push(bmpData);															//////////					}																				masker = new Masker();					//masker.x = txtSquare2.x;					masker.y = base.y;										masker.width = txtSquare.width;					masker.height = 80;				    addChild(masker);					scrollBar=new Scrollbar(txtSquare,masker);					scrollBar.x =  txtSquare.x;										//scrollBar.y = 100;										addChild(scrollBar);																	   }					  							);		}				/**		 * IExecutable オブジェクトが RemoveChild コマンド、または RemoveAllChild コマンド経由で表示リストから削除された場合に送出されます。		 * このイベント処理の実行中には、ExecutorObject を使用した非同期処理が行えます。		 */		override protected function atCastRemoved():void {			removeChild(base);			removeChild(scrollBar);						addCommand(			//new RemoveAllChildren(this)			);		}	}}