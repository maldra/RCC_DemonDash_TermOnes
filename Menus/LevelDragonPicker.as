package 
{

	import flash.display.MovieClip;


	public class LevelDragonPicker extends MovieClip
	{
		public function LevelDragonPicker(x,y)
		{
			this.x = x;
			this.y = y;
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
	}
}