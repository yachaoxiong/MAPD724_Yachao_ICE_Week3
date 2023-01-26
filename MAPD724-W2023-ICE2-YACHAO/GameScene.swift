import SpriteKit
import GameplayKit

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?

class GameScene: SKScene
{
    // instance variables
    var ocean1: Ocean?
    var ocean2: Ocean?
    var player: Player?
    var island: Island?
    var clouds : [Cloud] = []
    
    override func sceneDidLoad()
    {
        screenWidth = frame.width
        screenHeight = frame.height
        print("Screen Width: \(String(describing: screenWidth))")
        print("Screen Height: \(String(describing: screenHeight))")
        
        name = "GAME"
        
        // add the first ocean to the Scene
        ocean1 = Ocean()
        ocean1?.Reset()
        addChild(ocean1!)
        
        // add the second ocean to the scene
        ocean2 = Ocean()
        ocean2?.position.y = -627
        addChild(ocean2!)
        
        // add the player to the Scene
        player = Player()
        addChild(player!)
        
        // add the island to the Scene
        island = Island()
        addChild(island!)
        
        // add 3 clouds to the Scene
        for _ in 0...2
        {
            let cloud = Cloud()
            clouds.append(cloud)
            addChild(cloud)
        }
    }
    
    func touchDown(atPoint pos : CGPoint)
    {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -640))
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -640))
        
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -640))
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval)
    {
        ocean1?.Update()
        ocean2?.Update()
        player?.Update()
        island?.Update()
        
        // update each cloud in the clouds array
        for cloud in clouds
        {
            cloud.Update()
        }
        
    }
}
