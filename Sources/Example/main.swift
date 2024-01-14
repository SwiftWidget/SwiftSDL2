import SwiftSDL2

guard SDL_Init(SDL_INIT_VIDEO & SDL_INIT_TIMER) == 0 else {
    fatalError("SDL could not initialize! SDL_Error: \(String(cString: SDL_GetError()))")
}
SDL_SetHint(SDL_HINT_TRACKPAD_IS_TOUCH_ONLY, "1")

let window = SwiftSDL2.SDL_CreateWindow(
    "he",
    Int32(SDL_WINDOWPOS_CENTERED_MASK),
    Int32(SDL_WINDOWPOS_CENTERED_MASK),
    800,
    600,
    SDL_WINDOW_SHOWN.rawValue | SDL_WINDOW_OPENGL.rawValue | SDL_WINDOW_RESIZABLE.rawValue
)

// SDL_AddTimer(
//     2000,
//     { _, _ in

//         print("timer")
//         return 0
//     },
//     nil
// )

let renderer = SDL_CreateRenderer(
    window,
    -1,
    SDL_RENDERER_ACCELERATED.rawValue | SDL_RENDERER_PRESENTVSYNC.rawValue
)

var event = SDL_Event()
var renderCount = 0
while true {
    let ok = SDL_WaitEvent(&event)
    // let ok = SDL_PollEvent(&event)
    if ok == 1 {
        print("event:", event.type)
        if event.type == SDL_QUIT.rawValue {
            break
        }
    }

    var rect = SDL_Rect(x: 0, y: 0, w: 100, h: 100)
    SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255)
    SDL_RenderDrawRect(renderer, &rect)
    SDL_RenderPresent(renderer)
    // print("render:", renderCount)
    // renderCount += 1

}
