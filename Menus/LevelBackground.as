package 
{

	import flash.display.MovieClip;
	import flash.events.*;

	public class LevelBackground extends MovieClip
	{

		public function LevelBackground(x,y)
		{
			this.x = x;
			this.y = y;
			addEventListener(Event.ENTER_FRAME,loop,false,0,true);

		}
		public function getX()
		{
			return this.x;
		}
		public function setX(x)
		{
			this.x = x;
		}
		public function getY()
		{
			return this.y;
		}
		public function setY(y)
		{
			this.y = y;
		}
		public function getWidth()
		{
			return this.width;
		}
		public function getHeight()
		{
			return this.height;
		}
		function loop(e:Event)
		{

		}
	}

}