package  {
	import flash.display.MovieClip;
	
	public class Menu extends MovieClip{

		public function Menu() {
			// constructor code
			this.x = 0;
			this.y = 480;
		}
		
		public function addButton(bLabel:String, func:Function, x:Number, y:Number) {
			var b:Button = new Button(bLabel, func, x, y, this);
			this.addChild(b);
			b.gotoAndStop(b.bLabel);
		}
		
		public function removeMenu(){
			this.parent.removeChild(this);
		}

	}
	
}
