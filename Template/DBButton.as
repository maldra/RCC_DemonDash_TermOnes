package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	public class DBButton extends MovieClip{
		
		var buttonLabel:TextField = new TextField();

		public function DBButton(x, y) {
			this.x = x;
			this.y = y;
			
			buttonLabel.y = -this.height /2;
			
			
			addChild(buttonLabel);
			
			
		addEventListener(MouseEvent.MOUSE_DOWN, mouseClick);
			
		}
		function mouseClick(e:MouseEvent){
			
			buttonLabel.text = "Hey you"
		}
	}

}
