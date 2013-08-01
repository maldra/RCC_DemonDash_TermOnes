package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Button extends MovieClip{
		//bLabel is the label of the frame in the Button symbol.
		//Each frame contains a unique sprite.
		var bLabel:String;
		var func:Function;
		var bParent:Menu;

		public function Button(bLabel:String, func:Function, x:Number, y:Number, bParent:Menu) {
			// constructor code
			this.bLabel = bLabel;
			this.func = func;
			this.x = x;
			this.y = y;
			this.bParent = bParent;
			this.addEventListener(MouseEvent.CLICK, buttonClick);
		}
		
		public function buttonClick(event:MouseEvent)
		{
			this.bParent.removeMenu();
			this.func();
		}

	}
	
}
