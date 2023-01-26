import GameplayKit
import SpriteKit


class Player : GameObject
{
  //initializer
    init()
    {
        super.init(imageString : "plane", initialScale: 2.0)
        Start()
    }
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented!")
    }
    override func Start()
    {
       zPosition = 2
       Reset()
    }
    
    override func Update()
    {
        CheckBounds()
    }
    override func CheckBounds()
    {
        // constrain the player on the left boundary
        if(position.x <= -320)
        {
            position.x = -320
        }
        if(position.x >= 320)
        {
            position.x = 320
        }
        
    }
    
    override func Reset()
    {
        position.y = -640
    }
    func TouchMove(newPos : CGPoint)
    {
        position = newPos
    }
}
