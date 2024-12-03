   import Down

   let markdownString = NSLocalizedString("welcome_message", comment: "")
   let downView = try? DownView(frame: yourFrame, markdownString: markdownString)
   view.addSubview(downView!)
   