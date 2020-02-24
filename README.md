# iOSDelegateProtocolStudy
It is important to understand delegate and protocols since it is one of the most common communication patterns in iOS.  
This project helped me have a deeper understanding for delegate/protocol pattern and demonstrates how to use it in a simple app.  
Included are also notification/observer patterns.  

There are 2 views using One Piece Themes.    
Baseview: Has One Piece logo and presents SideSelector button.   
SideSelector: Once button is pressed in Baseview, you can choose between Marine or Pirate  
Baseview: Baseview will display Garp(for Marine) and Luffy(for pirate) depending on option in SideSelector 

SideSelector is the boss: has protocol definition and delegate variable. Calls the protocol methods with data as parameters.  
BaseView is the intern: Before presenting modally, the instance of SideSelector takes up the job as intern (delegate = self)
It then updates the character image&name accordingly.  

<p float="left">
  <img src="/sc/1.png" width="180" />
  <img src="/sc/2.png" width="180" /> 
  <img src="/sc/3.png" width="180" />
  <img src="/sc/4.png" width="180" />
</p>

Thanks to Sean Allen for the great learning material  
https://www.youtube.com/watch?v=DBWu6TnhLeY&t=653s 



