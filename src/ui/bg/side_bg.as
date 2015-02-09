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
	public class side_bg extends CastSprite {
		
		/**
		 * 新しい MyCastSprite インスタンスを作成します。
		 */
		 ////////////btn
		 
		 private var _top_btn:top_btn;
		 private var _aboutUs_btn:aboutUs_btn;
		 private var _works_btn:works_btn;
		 private var _cantact_btn:contact_btn;
		 private var _link_btn:link_btn;
		 private var _blog_btn:blog_btn;
		 private var _recruite_btn:recruite_btn;
		 private var _download_btn:download_btn;
		 
		 private var flag_Num:uint;
		 private var flag:Boolean;
		 
		 /////////
		 ////////////side_bg_tween
		 private var side_twn1:Tween;
         private var side_twn2:Tween;
         private var side_twn_arr:Array;
		 private var this_:Object;
		 
		  ///////////
		 private var _side_On_btn:next_btn;
		 
		 /////
		 private var _re_side_bg:re_side_bg;
		
		 
		 
		public function side_bg( initObject:Object = null ) {
			// 親クラスを初期化します。
			super( initObject );
			this.alpha = 0.6;
			this.x=-100;
			
			
			//////////btn
			_top_btn = new top_btn();
			_aboutUs_btn = new aboutUs_btn();
			_works_btn = new works_btn();
			_cantact_btn = new contact_btn();
			_link_btn = new link_btn();
			_blog_btn = new blog_btn();
			_recruite_btn = new recruite_btn();
			_download_btn = new download_btn();
			//////////
			flag_Num = this.width;
			
			side_twn_arr = new Array();
		    side_twn_arr[0]=side_twn1;
            side_twn_arr[1]=side_twn2;
			
			this_ = this;
			
			
			_side_On_btn = new next_btn();
			this.addChild(_side_On_btn);
			
			_side_On_btn.x = this.width;
			_side_On_btn.y = this.height/2;
			_side_On_btn.alpha = 0;
			_side_On_btn.scaleX = 1.5;
			_side_On_btn.scaleY = 1.5;
			
			_re_side_bg = new re_side_bg();
			_re_side_bg.y = this.height;
			
			
		}
		
		/**
		 * IExecutable オブジェクトが AddChild コマンド、または AddChildAt コマンド経由で表示リストに追加された場合に送出されます。
		 * このイベント処理の実行中には、ExecutorObject を使用した非同期処理が行えます。
		 */
		override protected function atCastAdded():void {
			//trace("引っ込む"+this.width);
			 stage.addEventListener(Event.ENTER_FRAME,ENTER_FRAME_);
			 //trace(this.x);
						 
						 function ENTER_FRAME_(e:Event):void {

	                   // マウスの座標を取得
	                   var mx : Number = stage.mouseX;
					   
	                   //var my : Number = stage.mouseY;
					   
					   if(mx <= flag_Num){
						
						
						  side_twn_arr[0]=new Tween(this_,"x",Quadratic.easeInOut,0,-170,3,true);
						  side_twn_arr[1]=new Tween(_side_On_btn,"alpha",Quadratic.easeInOut,0,1,5,true);
						  
						   }
						   else{
							 
							   }
							   
							  
						 }
						  
								  
			var pList1:ParallelList = new ParallelList();
			pList1.addCommand( 
                       new DoTweener( this , { x:0 , time:.5 , transition:"easeOutCirc" } )
					   
					   );
			
			var pList2:ParallelList = new ParallelList();
			pList2.addCommand( 
                     
					   
					   new AddChild(this, _top_btn),
							new AddChild(this, _aboutUs_btn),
							new AddChild(this, _works_btn),
							new AddChild(this, _cantact_btn),
							new AddChild(this, _link_btn),
							new AddChild(this, _blog_btn),
							new AddChild(this, _recruite_btn),
							new AddChild(this, _download_btn),
							new AddChild(this, _re_side_bg)
                       );
			insertCommand(pList2);
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
