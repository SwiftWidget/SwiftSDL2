// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import Foundation
import PackageDescription

let fliepath = URL(fileURLWithPath: #file).deletingLastPathComponent()

// common
var sources = [
    "src/SDL_assert.c",
    "src/SDL_dataqueue.c",
    "src/SDL_error.c",
    "src/SDL_guid.c",
    "src/SDL_hints.c",
    "src/SDL_list.c",
    "src/SDL_log.c",
    "src/SDL_utils.c",
    "src/SDL.c",
    "src/atomic",
    "src/cpuinfo",
    "src/events",
    "src/stdlib",
    "src/dynapi/SDL_dynapi.c",
]

// video
sources += [
    "src/video/SDL_blit_0.c",
    "src/video/SDL_blit_1.c",
    "src/video/SDL_blit_A.c",
    "src/video/SDL_blit_auto.c",
    "src/video/SDL_blit_copy.c",
    "src/video/SDL_blit_N.c",
    "src/video/SDL_blit_slow.c",
    "src/video/SDL_blit.c",
    "src/video/SDL_bmp.c",
    "src/video/SDL_clipboard.c",
    "src/video/SDL_egl.c",
    "src/video/SDL_fillrect.c",
    "src/video/SDL_pixels.c",
    "src/video/SDL_rect.c",
    "src/video/SDL_RLEaccel.c",
    "src/video/SDL_shape.c",
    "src/video/SDL_stretch.c",
    "src/video/SDL_surface.c",
    "src/video/SDL_video.c",
    "src/video/SDL_vulkan_utils.c",
    "src/video/SDL_yuv.c",
    "src/video/yuv2rgb/yuv_rgb.c",
    "src/video/dummy/",
    "src/video/offscreen/",
]

// timer
sources += [
    "src/timer/SDL_timer.c"
]

// thread
sources += [
    "src/thread/SDL_thread.c"
]

// file
sources += [
    "src/file/SDL_rwops.c"
]

// render
sources += [
    "src/render/SDL_render.c",
    "src/render/SDL_yuv_sw.c",
    "src/render/software/",
]

// sensor
sources += [
    "src/sensor/SDL_sensor.c",
    "src/sensor/dummy/",
]

// haptic
sources += [
    "src/haptic/SDL_haptic.c"
]

// joystick
sources += [
    "src/joystick/controller_type.c",
    "src/joystick/SDL_gamecontroller.c",
    "src/joystick/SDL_joystick.c",
    "src/joystick/SDL_steam_virtual_gamepad.c",
    "src/joystick/dummy/",
    "src/joystick/virtual/",
]

// audio
sources += [
    "src/audio/SDL_audio.c",
    "src/audio/SDL_audiocvt.c",
    "src/audio/SDL_audiodev.c",
    "src/audio/SDL_audiotypecvt.c",
    "src/audio/SDL_mixer.c",
    "src/audio/SDL_wave.c",
    "src/audio/dummy/",
    "src/audio/disk/",
]

// hidapi
sources += [
    "src/hidapi/SDL_hidapi.c"
]

// power
sources += [
    "src/power/SDL_power.c"
]

// locale
sources += [
    "src/locale/SDL_locale.c"
]

// misc
sources += [
    "src/misc/SDL_url.c"
]

// macOS specific
sources += [
    "src/file/cocoa",
    "src/filesystem/cocoa",
    "src/video/cocoa",
    "src/timer/unix",
    "src/thread/pthread",
    "src/loadso/dlopen",
    "src/render/opengl",
    "src/haptic/darwin",
    "src/joystick/darwin",
    "src/audio/coreaudio",
    "src/power/macosx",
    "src/locale/macosx",
    "src/misc/macosx",
]

let package = Package(
    name: "SwiftSDL2",
    platforms: [
        .macOS(.v10_14)
        // .iOS(.v12),
        // .tvOS(.v12),
        // .watchOS(.v5),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftSDL2",
            targets: ["SwiftSDL2"]
        )
    ],
    targets: [
        .target(
            name: "SwiftSDL2",
            exclude: [
                "src/hidapi/testgui"
            ],
            sources: sources,
            resources: [],
            linkerSettings: [
                .linkedLibrary("iconv")
            ]
        ),
        .executableTarget(
            name: "Example",
            dependencies: [
                "SwiftSDL2"
            ]
        ),
        .testTarget(
            name: "SwiftSDL2Tests",
            dependencies: ["SwiftSDL2"]
        ),
    ]
)
