﻿package ui{
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
	
	/**
	 * ...
	 * @author ...
	 */
	public class top_btn extends CastButton {
		
		/**
		 * 新しい MyCastButton インスタンスを作成します。
		 */
		public function top_btn( initObject:Object = null ) {
			// 親クラスを初期化します。
			super( initObject );
			
			// 移動先となるシーン識別子を設定します。
			sceneId = new SceneId( "/index" );
			
			// 外部リンクの場合には href プロパティに設定します。
			//href = "http://progression.jp/";
			this.alpha= 0.5;
		}
		
		/**
		 * IExecutable オブジェクトが AddChild コマンド、または AddChildAt コマンド経由で表示リストに追加された場合に送出されます。
		 * このイベント処理の実行中には、ExecutorObject を使用した非同期処理が行えます。
		 */
		override protected function atCastAdded():void {
			addCommand( 
                       new DoTweener( this , { y:this.height , time:.5 , transition:"easeOutCirc" } ) 
                       ); 
		}
		
		/**
		 * IExecutable オブジェクトが RemoveChild コマンド、または RemoveAllChild コマンド経由で表示リストから削除された場合に送出されます。
		 * このイベント処理の実行中には、ExecutorObject を使用した非同期処理が行えます。
		 */
		override protected function atCastRemoved():void {
		}
		
		/**
		 * Flash Player ウィンドウの CastButton インスタンスの上でユーザーがポインティングデバイスのボタンを押すと送出されます。
		 * このイベント処理の実行中には、ExecutorObject を使用した非同期処理が行えます。
		 */
		override protected function atCastMouseDown():void {
		}
		
		/**
		 * ユーザーが CastButton インスタンスからポインティングデバイスを離したときに送出されます。
		 * このイベント処理の実行中には、ExecutorObject を使用した非同期処理が行えます。
		 */
		override protected function atCastMouseUp():void {
		}
		
		/**
		 * ユーザーが CastButton インスタンスにポインティングデバイスを合わせたときに送出されます。
		 * このイベント処理の実行中には、ExecutorObject を使用した非同期処理が行えます。
		 */
		override protected function atCastRollOver():void {
			addCommand( 
                       new DoTweener( this , { alpha:1 , x:10 , time:.2 , transition:"easeOutCirc" } ) 
                       ); 
		}
		
		/**
		 * ユーザーが CastButton インスタンスからポインティングデバイスを離したときに送出されます。
		 * このイベント処理の実行中には、ExecutorObject を使用した非同期処理が行えます。
		 */
		override protected function atCastRollOut():void {
			addCommand( 
                       new DoTweener( this , { alpha:0.5 , x:0 , time:.2 , transition:"easeOutCirc" } ) 
                       );
		}
	}
}
