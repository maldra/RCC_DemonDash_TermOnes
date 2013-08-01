package  {
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	
	
	public class Dragon extends Entity {
		
		private var bullet:Bullet;
		private var stageRef:Stage;
		public function Dragon(x,y, stageRef:Stage) {
			super(x,y);
			this.stageRef=stageRef;
		}
		public function shoot(target:Enemy)
		{
			bullet=new Bullet(this.getX()+this.getWidth(),this.getY()+this.getHeight()/2,target,stageRef);
			trace(bullet);
			stageRef.addChild(bullet);
			
		}
		
	}
	
}

