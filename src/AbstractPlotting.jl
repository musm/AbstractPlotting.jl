__precompile__()
module AbstractPlotting

using Reactive, GeometryTypes, StaticArrays, ColorTypes, Colors, IntervalSets
# Text related packages
using Packing
using SignedDistanceFields
using Fontconfig, FreeType, FreeTypeAbstraction, UnicodeFun

using Base: RefValue
using Base.Iterators: repeated, drop
import Base: getindex, setindex!, push!, append!, parent, scale!, get, get!, delete!, haskey


include("utilities/quaternions.jl")
include("types.jl")
include("utilities/compat.jl")
include("utilities/utilities.jl")
include("utilities/logging.jl")
include("utilities/texture_atlas.jl")
include("interaction/nodes.jl")

# Basic scene/plot/recipe interfaces + types
include("scenes.jl")
include("recipes.jl")
include("interfaces.jl")
include("conversions.jl")

# camera types + functions
include("camera/projection_math.jl")
include("camera/camera.jl")
include("camera/camera2d.jl")
include("camera/camera3d.jl")

# layoting of plots
include("layouting/transformation.jl")

# some default recipes
include("basic_recipes/basic_recipes.jl")
include("layouting/layouting.jl")
include("basic_recipes/buffers.jl")
include("basic_recipes/axis.jl")
include("basic_recipes/legend.jl")

#
include("interaction/events.jl")
include("interaction/gui.jl")


# Abstract/Concrete scene + plot types
export AbstractScene, SceneLike, Scene, AbstractScreen
export AbstractPlot, Combined, Atomic

# Theming, working with Plots
export Attributes, Theme, attributes, arguments, default_theme

# Node/Signal related
export Node, node, lift, map_once

# utilities and macros
export @recipe, @extract, @extractvalue, @key_str, @get_attribute
export broadcast_foreach, to_vector

# conversion infrastructure
export @key_str, convert_attribute, convert_arguments
export to_color, to_colormap, to_rotation, to_font, to_align, to_textsize
export to_ndim

# Transformations
export translated, translate!, transform!, scale!, rotate!, grid, Accum, Absolute
export boundingbox, insertplots!, center!

# camera related
export AbstractCamera, EmptyCamera, Camera, Camera2D, Camera3D, cam2d!, campixel!, cam3d!, update_cam!
export pixelarea, plots, cameracontrols, cameracontrols!, camera, events

# picking + interactive use cases + events
export mouseover, ispressed, onpick, pick, Events, Keyboard, Mouse
export register_callbacks
export window_area
export window_open
export mouse_buttons
export mouse_position
export mousedrag
export scroll
export keyboard_buttons
export unicode_input
export dropped_files
export hasfocus
export entered_window
export disconnect!, must_update, force_update!


# gui
export slider, button, playbutton

# Raymarching algorithms
export RaymarchAlgorithm, IsoValue, Absorption, MaximumIntensityProjection, AbsorptionRGBA, IndexedAbsorptionRGBA
export Billboard

# Reexports of
# Color/Vector types convenient for 3d/2d graphics
export RGBAf0, RGBf0, VecTypes, RealVector, FRect, FRect2D, IRect2D
export FRect3D, IRect3D, Rect3D, Transformation
export IRect, FRect, Rect, Sphere
export Vec3f0, Vec2f0, Point3f0, Point2f0
#export (..) # reexport interval

export plot!, plot

end # module