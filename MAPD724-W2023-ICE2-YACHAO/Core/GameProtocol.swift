protocol GameProtocol
{
    // initialization
    func Start()
    
    //update every frame
    func Update()
    
    //check if the position is outsize the bounds of the screen
    func CheckBounds()
    
    // a method to reset the position
    func Reset()
    
}
