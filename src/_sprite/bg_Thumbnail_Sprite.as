﻿package _sprite{	import jp.progression.casts.*;	import jp.progression.commands.display.*;	import jp.progression.commands.lists.*;	import jp.progression.commands.managers.*;	import jp.progression.commands.media.*;	import jp.progression.commands.net.*;	import jp.progression.commands.tweens.*;	import jp.progression.commands.*;	import jp.progression.data.*;	import jp.progression.events.*;	import jp.progression.scenes.*;	import ui.*;	import _sprite.*;		/**	 * ...	 * @author ...	 */	public class bg_Thumbnail_Sprite extends CastSprite {				/**		 * 新しい MyCastSprite インスタンスを作成します。		 */		private var _imageUrl:String;		private var _sceneId:SceneId;		private var _button:Btn_Thumbnail;				public function bg_Thumbnail_Sprite( initObject:Object = null ) {			// 親クラスを初期化します。			super( initObject );		}		public function set sceneId(value:SceneId):void 		{			_sceneId = value;		}				public function set imageUrl(value:String):void 		{			_imageUrl = value;		}				/**		 * IExecutable オブジェクトが AddChild コマンド、または AddChildAt コマンド経由で表示リストに追加された場合に送出されます。		 * このイベント処理の実行中には、ExecutorObject を使用した非同期処理が行えます。		 */		override protected function atCastAdded():void {			_button = new Btn_Thumbnail( { imageUrl:_imageUrl } );			_button.sceneId = _sceneId;						addCommand(				// 任意のコマンドを記述してください。				new AddChild(this, _button)			);		}				/**		 * IExecutable オブジェクトが RemoveChild コマンド、または RemoveAllChild コマンド経由で表示リストから削除された場合に送出されます。		 * このイベント処理の実行中には、ExecutorObject を使用した非同期処理が行えます。		 */		override protected function atCastRemoved():void {			addCommand(				// 任意のコマンドを記述してください。				new RemoveChild(this, _button)							);		}	}}