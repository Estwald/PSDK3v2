/*! \file commands.h
 \brief RSX commands.

These are functions to enqueue commands into the RSX's command buffer.
*/

#ifndef __RSX_COMMANDS_H__
#define __RSX_COMMANDS_H__

#include <rsx/gcm_sys.h>
#include <rsx/rsx_program.h>

#ifdef __cplusplus
extern "C" {
#endif

/*! \brief Set drawing direction of front face.
\param context Pointer to the context object.
\param dir Drawing direction of front face. Possible values are:
- \ref GCM_FRONTFACE_CW
- \ref GCM_FRONTFACE_CCW
*/
void rsxSetFrontFace(gcmContextData *context,u32 dir);

/*! \brief Set culling mode.
\param context Pointer to context object.
\param cull Type of cull mode. Possible values are:
- \ref GCM_CULL_FRONT
- \ref GCM_CULL_BACK
- \ref GCM_CULL_ALL
*/
void rsxSetCullFace(gcmContextData *context,u32 cull);

/*! \brief Enable/Disable face culling.
\param context Pointer to the context object.
\param enable Enable flag. Possible values are:
 - \ref GCM_TRUE
 - \ref GCM_FALSE
 */
void rsxSetCullFaceEnable(gcmContextData *context,u32 enable);

/*! \brief Enable/Disable write to depth buffer.
\param context Pointer to the context object.
\param enable Enable flag. Possible values are:
- \ref GCM_TRUE
- \ref GCM_FALSE
*/
void rsxSetDepthWriteEnable(gcmContextData *context,u32 enable);

/*! \brief Stop the render sequence.

Stops the rendering for a primitive, started by \ref rsxDrawVertexBegin.
\param context Pointer to the context object.
*/
void rsxDrawVertexEnd(gcmContextData *context);

/*! \brief Set the shading model for the render sequence.
\param context Pointer to the context object.
\param shadeModel Type of shading model. Possible values are:
- \ref GCM_SHADE_MODEL_FLAT
- \ref GCM_SHADE_MODEL_SMOOTH
*/
void rsxSetShadeModel(gcmContextData *context,u32 shadeModel);

/*! \brief Start the render sequence.

Starts the rendering for a primitive.
\param context Pointer to the context object.
\param type Type of primitive to render. Possible values are:
- \ref GCM_TYPE_POINTS
- \ref GCM_TYPE_LINES
- \ref GCM_TYPE_LINE_LOOP
- \ref GCM_TYPE_LINE_STRIP
- \ref GCM_TYPE_TRIANGLES
- \ref GCM_TYPE_TRIANGLE_STRIP
- \ref GCM_TYPE_TRIANGLE_FAN
- \ref GCM_TYPE_QUADS
- \ref GCM_TYPE_QUAD_STRIP
- \ref GCM_TYPE_POLYGON
*/
void rsxDrawVertexBegin(gcmContextData *context,u32 type);

void rsxDrawVertex2f(gcmContextData *context,u8 idx,f32 x,f32 y);
void rsxDrawVertex3f(gcmContextData *context,u8 idx,f32 x,f32 y,f32 z);
void rsxDrawVertex4f(gcmContextData *context,u8 idx,f32 x,f32 y,f32 z,f32 w);
void rsxSetScissor(gcmContextData *context,u16 x,u16 y,u16 w,u16 h);

/*! \brief Specify the value used for depth buffer comparisons.
\param context Pointer to the context object.
\param func Specifies the depth comparison function. Possible values are:
 - \ref GCM_NEVER
 - \ref GCM_LESS
 - \ref GCM_EQUAL
 - \ref GCM_LEQUAL
 - \ref GCM_GREATER
 - \ref GCM_NOTEQUAL
 - \ref GCM_GEQUAL
 - \ref GCM_ALWAYS
*/
void rsxSetDepthFunc(gcmContextData *context,u32 func);

/*! \brief Enable or disable the depth test.

If depth test is enabled, the GPU performs depth comparisons and updates the
depth buffer.
Note that even if the depth buffer exists and the depth mask is non-zero,
the depth buffer is not updated if the depth test is disabled.
\param context Pointer to the context object.
\param enable Enable flag. Possible values are:
 - \ref GCM_TRUE
 - \ref GCM_FALSE
*/
void rsxSetDepthTestEnable(gcmContextData *context,u32 enable);

/*! \brief Clear the render surface.

This function clears the chosen selection of color components, depth and stencil
values for all pixels in the destination surface. The clear color can be chosen
using \ref rsxSetClearColor, and the clear value for the depth buffer is set
using \ref rsxSetClearDepthValue.

\param context Pointer to the context object.
\param clear_mask A selection of components to be cleared. Must be an OR
combination of the following values:
 - \ref GCM_CLEAR_Z
 - \ref GCM_CLEAR_S
 - \ref GCM_CLEAR_R
 - \ref GCM_CLEAR_G
 - \ref GCM_CLEAR_B
 - \ref GCM_CLEAR_A
The value of \ref GCM_CLEAR_M can also be chosen, to clear all RGBA components,
depth and stencil buffers.
*/
void rsxClearSurface(gcmContextData *context,u32 clear_mask);

/*! \brief Set the clear depth value.

This value is used by the \ref rsxClearSurface function.
\param context Pointer to the context object.
\param value Color value 
*/
void rsxSetClearDepthValue(gcmContextData *context,u32 value);
void rsxSetReturnCommand(gcmContextData *context);
void rsxSetCallCommand(gcmContextData *context,u32 offset);
void rsxSetJumpCommand(gcmContextData *context,u32 offset);
void rsxSetNopCommand(gcmContextData *context,u32 count);

/*! \brief Set the clear color.

The clear color value is used by the \ref rsxClearSurface function.
\param context Pointer to the context object.
\param color The clear color value.
*/
void rsxSetClearColor(gcmContextData *context,u32 color);

/*! \brief Enable or disable write access to the framebuffer color components.
\param context Pointer to the context object.
\param mask A selection of the components to enable write access. It is an OR
combination of the following values:
 - \ref GCM_COLOR_MASK_B
 - \ref GCM_COLOR_MASK_G
 - \ref GCM_COLOR_MASK_R
 - \ref GCM_COLOR_MASK_A
*/
void rsxSetColorMask(gcmContextData *context,u32 mask);

/*! \brief Enable or disable write access to the framebuffer color components
(Multiple Render Target output).
\param context Pointer to the context object.
\param mask A selection of the components to enable write access. It is an OR
combination of the following values:
 - \ref GCM_COLOR_MASK_B
 - \ref GCM_COLOR_MASK_G
 - \ref GCM_COLOR_MASK_R
 - \ref GCM_COLOR_MASK_A
*/
void rsxSetColorMaskMRT(gcmContextData *context,u32 mask);

/*! \brief Setup the render surface.

This function is used to setup the render target where RSX should render the frame into.
\param context Pointer to the context object.
\param surface Pointer to the surface object.
*/
void rsxSetSurface(gcmContextData *context,gcmSurface *surface);
void rsxSetReferenceCommand(gcmContextData *context,u32 ref_value);

/*! \brief Enqueues a Wait for label command.
\param context Pointer to the context object.
\param index Label index
\param valuie Label value
*/
void rsxSetWaitLabel(gcmContextData *context,u8 index,u32 value);

/*! \brief Enqueues a Write Command label command.
\param context Pointer to the context object.
\param index Label index
\param value Label value
*/
void rsxSetWriteCommandLabel(gcmContextData *context,u8 index,u32 value);

/*! \brief Enqueues a Write Backend label command.
\param context Pointer to the context object.
\param index Label index
\param value Label value
*/
void rsxSetWriteBackendLabel(gcmContextData *context,u8 index,u32 value);

void rsxSetViewportClip(gcmContextData *context,u8 sel,u16 width,u16 height);

/*! \brief Set viewport.

This function sets the viewport.<br/>
The origin (0,0) of the normalized device coordinate points to the center of the screen.<br/> 
Performing viewport conversion, where the upper left corner is the origin is as follows:
\code
	x = X;
	y = Y;
	width = WIDTH;
	height = HEIGHT;
	min = 0.0f;
	max = 1.0f;
	scale[0] = width * 0.5f;
	scale[1] = height * 0.5f;
	scale[2] = (max - min) * 0.5f;
	offset[0] = x + width * 0.5f;
	offset[1] = y + height * 0.5f;
	offset[2] = (max + min) * 0.5f;
\endcode
<br/><br/>
Performing viewport conversion, where the lower left corner is the origin is as follows (this is equivalent to glViewport):
\code
	x = X;
	y = WINDOW_HEIGHT - Y - HEIGHT;
	width = WIDTH;
	height = HEIGHT;
	min = 0.0f;
	max = 1.0f;
	scale[0] = width * 0.5f;
	scale[1] = height * -0.5f;
	scale[2] = (max - min) * 0.5f;
	offset[0] = x + width * 0.5f;
	offset[1] = y + height * 0.5f;
	offset[2] = (max + min) * 0.5f;
\endcode
\param context Pointer to the context object.
\param x Origin of the viewport rectangle in pixels (0 - 4095). Initial value is (0,0).
\param y Origin of the viewport rectangle in pixels (0 - 4095). Initial value is (0,0).
\param width Width of the viewport (0 - 4096). Initial value is 4096.
\param height Height of the viewport (0 - 4096). Initial value is 4096.
\param min Minimum Z clip value. Initial value is 0.0.
\param max Maximum Z clip value. Initial value is 1.0.
\param scale Scale values to be used for viewport conversion. Initial values are (2048.0,2048.0,0.5,0.0).
\param offset Offset values to be used for viewport conversion. Initial values are (2048.0,2048.0,0.5,0.0).
*/
void rsxSetViewport(gcmContextData *context,u16 x,u16 y,u16 width,u16 height,f32 min,f32 max,const f32 scale[4],const f32 offset[4]);

/*! \brief Invalidates a texture cache.
\param context Pointer to the context object.
\param type Type of texture cache to be invalidated. Possible values are:
 - \ref GCM_INVALIDATE_TEXTURE
 - \ref GCM_INVALIDATE_VERTEX_TEXTURE
*/
void rsxInvalidateTextureCache(gcmContextData *context,u32 type);

/*! \brief Loads a texture.
\param context Pointer to the context object.
\param index Texture index.
\param texture Pointer to the texture data.
*/
void rsxLoadTexture(gcmContextData *context,u8 index,const gcmTexture *texture);

/*! \brief Set texture control parameters.
\param context Pointer to the context object.
\param index Texture index.
\param enable Enable flag. Possible values are:
 - \ref GCM_TRUE
 - \ref GCM_FALSE
\param minlod minimum level of detail.
\param maxlod maximum level of detail.
\param maxaniso sample level of the anisotropic filter. Possible values are:
 - \ref GCM_TEXTURE_MAX_ANISO_1
 - \ref GCM_TEXTURE_MAX_ANISO_2
 - \ref GCM_TEXTURE_MAX_ANISO_4
 - \ref GCM_TEXTURE_MAX_ANISO_6
 - \ref GCM_TEXTURE_MAX_ANISO_8
 - \ref GCM_TEXTURE_MAX_ANISO_10
 - \ref GCM_TEXTURE_MAX_ANISO_12
 - \ref GCM_TEXTURE_MAX_ANISO_16
\todo finish args documentation.
*/
void rsxTextureControl(gcmContextData *context,u8 index,u32 enable,u16 minlod,u16 maxlod,u8 maxaniso);
void rsxTextureFilter(gcmContextData *context,u8 index,u8 min,u8 mag,u8 conv);
void rsxTextureWrapMode(gcmContextData *context,u8 index,u8 wraps,u8 wrapt,u8 wrapr,u8 unsignedRemap,u8 zfunc,u8 gamma);

/*! \brief Load a compiled vertex shader program.
\param context Pointer to the context object
\param program Pointer to the vertex program configuration
\param ucode Pointer to the shader micro code
*/
void rsxLoadVertexProgram(gcmContextData *context,rsxVertexProgram *program,const void *ucode);

/*! \brief Load a compiled fragment shader program.
\param context Pointer to the context object
\param program Pointer to the fragment program configuration
\param offset Memory offset of fragment program
\param location Memory location type where the program relies. Possible values are:
- \ref GCM_LOCATION_RSX
- \ref GCM_LOCATION_CELL
*/
void rsxLoadFragmentProgramLocation(gcmContextData *context,rsxFragmentProgram *program,u32 offset,u32 location);
void rsxZControl(gcmContextData *context,u8 cullNearFar,u8 zClampEnable,u8 cullIgnoreW);
void rsxLoadVertexProgramBlock(gcmContextData *context,rsxVertexProgram *program,const void *ucode);
void rsxLoadVertexProgramParameterBlock(gcmContextData *context,u32 base_const,u32 const_cnt,const f32 *value); 
void rsxSetVertexProgramParameter(gcmContextData *context,rsxVertexProgram *program,s32 index,const f32 *value);
void rsxSetFragmentProgramParameter(gcmContextData *context,rsxFragmentProgram *program,s32 index,const f32 *value,u32 offset);
void rsxDrawVertexArray(gcmContextData *context,u32 type,u32 start,u32 count);
void rsxBindVertexArrayAttrib(gcmContextData *context,u8 attr,u32 offset,u8 stride,u8 elems,u8 dtype,u8 location);
void rsxDrawIndexArray(gcmContextData *context,u32 type,u32 offset,u32 count,u32 data_type,u32 location);
void rsxInlineTransfer(gcmContextData *context,const u32 dstOffset,const void *srcAddress,const u32 sizeInWords,const u8 location);
void rsxSetUserClipPlaneControl(gcmContextData *context,u32 plane0,u32 plane1,u32 plane2,u32 plane3,u32 plane4,u32 plane5);

/*! \brief Specify pixel arithmetic.

In RGBA mode, pixels can be drawn using a function that blends the incoming
(source) RGBA values with the RGBA values that are already in the frame buffer
(the destination values). Blending is initially disabled.
Use \ref rsxSetBlendEnable to enable and disable blending.

\c rsxSetBlendFunc defines the operation of blending when it is enabled.
\p sfcolor and and \p sfalpha specify which method is used to scale the source
color and alpha components.
\p dfcolor and and \p dfalpha specify which method is used to scale the
destination color and alpha components.
The possible methods are described in the following table.
Each method defines four scale factors, one each for red, green, blue, and
alpha.
In the table and in subsequent equations, source and destination color
components are referred to as R<sub>s</sub>, G<sub>s</sub>, B<sub>s</sub>,
A<sub>s</sub> and R<sub>d</sub>, G<sub>d</sub>, B<sub>d</sub>, A<sub>d</sub>,
respectively.
The color specified by \ref rsxSetBlendColor is referred to as
R<sub>c</sub>, G<sub>c</sub>, B<sub>c</sub>, A<sub>c</sub>.
They are understood to have integer values between 0 and
k<sub>R</sub>, k<sub>G</sub>, k<sub>B</sub>, k<sub>A</sub>, where

k<sub>c</sub> = 2<sup>m<sub>c</sub></sup> - 1

and m<sub>R</sub>, m<sub>G</sub>, m<sub>B</sub>, m<sub>A</sub> is the number of
red, green, blue, and alpha bitplanes.

Source and destination scale factors are referred to as
s<sub>R</sub>, s<sub>G</sub>, s<sub>B</sub>, s<sub>A</sub> and d<sub>R</sub>,
d<sub>G</sub>, d<sub>B</sub>, d<sub>A</sub>.
The scale factors described in the table, denoted f<sub>R</sub>, f<sub>G</sub>,
f<sub>B</sub>, f<sub>A</sub>, represent either source or destination
factors. All scale factors have range [0,1].

<table>
<tr><th>Parameter                        </th><th>f<sub>R</sub>                </th><th>f<sub>G</sub>                </th><th>f<sub>B</sub>                </th><th>f<sub>A</sub>                </th></tr>
<tr><td>\ref GCM_ZERO                    </td><td>0                            </td><td>0                            </td><td>0                            </td><td>0                            </td></tr>
<tr><td>\ref GCM_ONE                     </td><td>1                            </td><td>1                            </td><td>1                            </td><td>1                            </td></tr>
<tr><td>\ref GCM_SRC_COLOR               </td><td>R<sub>s</sub>/k<sub>R</sub>  </td><td>G<sub>s</sub>/k<sub>G</sub>  </td><td>B<sub>s</sub>/k<sub>B</sub>  </td><td>A<sub>s</sub>/k<sub>A</sub>  </td></tr>
<tr><td>\ref GCM_ONE_MINUS_SRC_COLOR     </td><td>1-R<sub>s</sub>/k<sub>R</sub></td><td>1-G<sub>s</sub>/k<sub>G</sub></td><td>1-B<sub>s</sub>/k<sub>B</sub></td><td>1-A<sub>s</sub>/k<sub>A</sub></td></tr>
<tr><td>\ref GCM_DST_COLOR               </td><td>R<sub>d</sub>/k<sub>R</sub>  </td><td>G<sub>d</sub>/k<sub>G</sub>  </td><td>B<sub>d</sub>/k<sub>B</sub>  </td><td>A<sub>d</sub>/k<sub>A</sub>  </td></tr>
<tr><td>\ref GCM_ONE_MINUS_DST_COLOR     </td><td>1-R<sub>d</sub>/k<sub>R</sub></td><td>1-G<sub>d</sub>/k<sub>G</sub></td><td>1-B<sub>d</sub>/k<sub>B</sub></td><td>1-A<sub>d</sub>/k<sub>A</sub></td></tr>
<tr><td>\ref GCM_SRC_ALPHA               </td><td>A<sub>s</sub>/k<sub>A</sub>  </td><td>A<sub>s</sub>/k<sub>A</sub>  </td><td>A<sub>s</sub>/k<sub>A</sub>  </td><td>A<sub>s</sub>/k<sub>A</sub>  </td></tr>
<tr><td>\ref GCM_ONE_MINUS_SRC_ALPHA     </td><td>1-A<sub>s</sub>/k<sub>A</sub></td><td>1-A<sub>s</sub>/k<sub>A</sub></td><td>1-A<sub>s</sub>/k<sub>A</sub></td><td>1-A<sub>s</sub>/k<sub>A</sub></td></tr>
<tr><td>\ref GCM_DST_ALPHA               </td><td>A<sub>d</sub>/k<sub>A</sub>  </td><td>A<sub>d</sub>/k<sub>A</sub>  </td><td>A<sub>d</sub>/k<sub>A</sub>  </td><td>A<sub>d</sub>/k<sub>A</sub>  </td></tr>
<tr><td>\ref GCM_ONE_MINUS_DST_ALPHA     </td><td>1-A<sub>d</sub>/k<sub>A</sub></td><td>1-A<sub>d</sub>/k<sub>A</sub></td><td>1-A<sub>d</sub>/k<sub>A</sub></td><td>1-A<sub>d</sub>/k<sub>A</sub></td></tr>
<tr><td>\ref GCM_CONSTANT_COLOR          </td><td>R<sub>c</sub>                </td><td>G<sub>c</sub>                </td><td>B<sub>c</sub>                </td><td>A<sub>c</sub>                </td></tr>
<tr><td>\ref GCM_ONE_MINUS_CONSTANT_COLOR</td><td>1-R<sub>c</sub>              </td><td>1-G<sub>c</sub>              </td><td>1-B<sub>c</sub>              </td><td>1-A<sub>c</sub>              </td></tr>
<tr><td>\ref GCM_CONSTANT_ALPHA          </td><td>A<sub>c</sub>                </td><td>A<sub>c</sub>                </td><td>A<sub>c</sub>                </td><td>A<sub>c</sub>                </td></tr>
<tr><td>\ref GCM_ONE_MINUS_CONSTANT_ALPHA</td><td>1-A<sub>c</sub>              </td><td>1-A<sub>c</sub>              </td><td>1-A<sub>c</sub>              </td><td>1-A<sub>c</sub>              </td></tr>
<tr><td>\ref GCM_SRC_ALPHA_SATURATE      </td><td>i                            </td><td>i                            </td><td>i                            </td><td>1                            </td></tr>
</table>
In the table,

i = min(A<sub>s</sub>/k<sub>A</sub>, 1 - A<sub>d</sub>/k<sub>A</sub>)

To determine the blended RGBA values of a pixel when drawing in RGBA mode,
the equation defined by \ref rsxSetBlendEquation us used. In the default mode
(\ref GCM_FUNC_ADD for RGB and alpha equations), the equations are the
following:

 - R<sub>d</sub> = min(k<sub>R</sub>, R<sub>s</sub>s<sub>R</sub> + R<sub>d</sub>d<sub>R</sub>)
 - G<sub>d</sub> = min(k<sub>G</sub>, G<sub>s</sub>s<sub>G</sub> + G<sub>d</sub>d<sub>G</sub>)
 - B<sub>d</sub> = min(k<sub>B</sub>, B<sub>s</sub>s<sub>B</sub> + B<sub>d</sub>d<sub>B</sub>)
 - A<sub>d</sub> = min(k<sub>A</sub>, A<sub>s</sub>s<sub>A</sub> + A<sub>d</sub>d<sub>A</sub>)

Despite the apparent precision of the above equations, blending arithmetic is
not exactly specified, because blending operates with imprecise integer color
values.
However, a blend factor that should be equal to 1 is guaranteed not to modify
its multiplicand, and a blend factor equal to 0 reduces its multiplicand to 0.
For example, when \p sfcolor is \ref GCM_SRC_ALPHA, \p fdcolor is
\ref GCM_ONE_MINUS_SRC_ALPHA, and A<sub>s</sub> is equal to k<sub>A</sub>,
the equations reduce to simple replacement:

R<sub>d</sub> = R<sub>s</sub> ;
G<sub>d</sub> = G<sub>s</sub> ;
B<sub>d</sub> = B<sub>s</sub>

\par Examples

Transparency is best implemented using blend function
(\p sfcolor = \p sfalpha = \ref GCM_SRC_ALPHA,
\p dfcolor = \p dfalpha = \ref GCM_ONE_MINUS_SRC_ALPHA) with primitives sorted from
farthest to nearest. Note that this transparency calculation does not require
the presence of alpha bitplanes in the frame buffer.

Blend function (\ref GCM_SRC_ALPHA, \ref GCM_ONE_MINUS_SRC_ALPHA) is also useful
for rendering antialiased points and lines in arbitrary order.

Polygon antialiasing is optimized using blend function
(\ref GCM_SRC_ALPHA_SATURATE, \ref GCM_ONE) with polygons sorted from nearest
to farthest. <!-- (See the glEnable, glDisable reference page and the GL_POLYGON_SMOOTH
argument for information on polygon antialiasing.) -->
Destination alpha bitplanes, which must be present for this blend function to
operate correctly, store the accumulated coverage.

\par Notes

Incoming (source) alpha is correctly thought of as a material opacity, ranging
from 1.0 ( k<sub>A</sub> ), representing complete opacity, to 0.0 (0),
representing complete transparency.


\param context Pointer to the context object
\param sfcolor Specifies how the red, green, and blue source blending factors are computed.
\param dfcolor Specifies how the red, green, and blue source blending factors are computed.
\param sfalpha Specifies how the alpha source blending factor is computed.
\param dfalpha Specifies how the alpha destination blending factor is computed.
*/
void rsxSetBlendFunc(gcmContextData *context,u16 sfcolor,u16 dfcolor,u16 sfalpha,u16 dfalpha);

/*! \brief Set the blend equation.

The blend equations determine how a new pixel (the &ldquo;source&rdquo; color)
is combined with a pixel already in the framebuffer (the
&ldquo;destination&rdquo; color).
This function specifies one blend equation for the RGB-color components
and one blend equation for the alpha component.

These equations use the source and destination blend factors specified by
\ref rsxSetBlendFunc. See \ref rsxSetBlendFunc for a description of the various
blend factors.

In the equations that follow, source and destination color components are
referred to as R<sub>s</sub>, G<sub>s</sub>, B<sub>s</sub>, A<sub>s</sub>
and R<sub>d</sub>, G<sub>d</sub>, B<sub>d</sub>, A<sub>d</sub>, respectively.
The result color is referred to as R<sub>r</sub>, G<sub>r</sub>, B<sub>r</sub>,
A<sub>r</sub>.
The source and destination blend factors are denoted
s<sub>R</sub>, s<sub>G</sub>, s<sub>B</sub>, s<sub>A</sub> and d<sub>R</sub>,
d<sub>G</sub>, d<sub>B</sub>, d<sub>A</sub>, respectively.
For these equations all color components are understood to have values in the
range [0,1].

<table>
<tr><th>Mode                          </th><th>R<sub>r</sub>                                        </th><th>G<sub>r</sub>                                        </th><th>B<sub>r</sub>                                        </th><th>A<sub>r</sub>                                        </th></tr>
<tr><td>\ref GCM_FUNC_ADD             </td><td>R<sub>s</sub>s<sub>R</sub>+R<sub>d</sub>d<sub>R</sub></td><td>G<sub>s</sub>s<sub>G</sub>+G<sub>d</sub>d<sub>G</sub></td><td>B<sub>s</sub>s<sub>B</sub>+B<sub>d</sub>d<sub>B</sub></td><td>A<sub>s</sub>s<sub>A</sub>+A<sub>d</sub>d<sub>A</sub></td></tr>
<tr><td>\ref GCM_MIN                  </td><td>min(R<sub>s</sub>,R<sub>d</sub>)                     </td><td>min(G<sub>s</sub>,G<sub>d</sub>)                     </td><td>min(B<sub>s</sub>,B<sub>d</sub>)                     </td><td>min(A<sub>s</sub>,A<sub>d</sub>)                     </td></tr>
<tr><td>\ref GCM_MAX                  </td><td>max(R<sub>s</sub>,R<sub>d</sub>)                     </td><td>max(G<sub>s</sub>,G<sub>d</sub>)                     </td><td>max(B<sub>s</sub>,B<sub>d</sub>)                     </td><td>max(A<sub>s</sub>,A<sub>d</sub>)                     </td></tr>
<tr><td>\ref GCM_FUNC_SUBTRACT        </td><td>R<sub>s</sub>s<sub>R</sub>-R<sub>d</sub>d<sub>R</sub></td><td>G<sub>s</sub>s<sub>G</sub>-G<sub>d</sub>d<sub>G</sub></td><td>B<sub>s</sub>s<sub>B</sub>-B<sub>d</sub>d<sub>B</sub></td><td>A<sub>s</sub>s<sub>A</sub>-A<sub>d</sub>d<sub>A</sub></td></tr>
<tr><td>\ref GCM_FUNC_REVERSE_SUBTRACT</td><td>R<sub>d</sub>d<sub>R</sub>-R<sub>s</sub>s<sub>R</sub></td><td>G<sub>d</sub>d<sub>G</sub>-G<sub>s</sub>s<sub>G</sub></td><td>B<sub>d</sub>d<sub>B</sub>-B<sub>s</sub>s<sub>B</sub></td><td>A<sub>d</sub>d<sub>A</sub>-A<sub>s</sub>s<sub>A</sub></td></tr>
</table>

The results of these equations are clamped to the range [0,1].

The \ref GCM_MIN and \ref GCM_MAX equations are useful for applications that
analyze image data (image thresholding against a constant color, for example).
The \ref GCM_FUNC_ADD equation is useful for antialiasing and transparency,
among other things.

Initially, both the RGB blend equation and the alpha blend equation are set
to \ref GCM_FUNC_ADD.

\par Notes

The \ref GCM_MIN, and \ref GCM_MAX equations do not use the source or
destination factors, only the source and destination colors.

\param context Pointer to the context object
\param color Specifies the RGB blend equation, how the red, green, and blue
components of the source and destination colors are combined.
\param alpha Specifies the alpha blend equation, how the alpha component of
the source and destination colors are combined.
*/
void rsxSetBlendEquation(gcmContextData *context,u16 color,u16 alpha);


/*! \brief Set the blending constant color.
\param context Pointer to the context object
\param color0 all A, R, G, B components in 8-bit component mode
\param color1 reserved for 16-bit components
*/
void rsxSetBlendColor(gcmContextData *context,u32 color0,u32 color1);

/*! \brief Enable or disable blending.
\param context Pointer to the context object
\param enable
  - \c GCM_TRUE : enable blending
  - \c GCM_FALSE : disable blending
*/
void rsxSetBlendEnable(gcmContextData *context,u32 enable);

void rsxSetTransformBranchBits(gcmContextData *context,u32 branchBits);

/*! \brief Configuration the mode for an upcoming asynchronous RSX DMA transfer.
\param context Pointer to the context object
\param mode Specify source and destination memory areas. Possible values are:
- \ref GCM_TRANSFER_LOCAL_TO_LOCAL
- \ref GCM_TRANSFER_MAIN_TO_LOCAL
- \ref GCM_TRANSFER_LOCAL_TO_MAIN
- \ref GCM_TRANSFER_MAIN_TO_MAIN
*/
void rsxSetTransferDataMode(gcmContextData *context,u8 mode);

/*! \brief Specify the memory locations for an RSX DMA transfer. This function should be called after rsxSetTransferDataMode() and rsxSetTransferDataFormat().
\param context Pointer to the context object
\param dst Destination memory offset, e.g., a value returned by gcmAddressToOffset() or gcmMapMainMemory().
\param src Source memory offset, e.g., a value returned by gcmAddressToOffset() or gcmMapMainMemory().
*/
void rsxSetTransferDataOffset(gcmContextData *context,u32 dst,u32 src);

/*! \brief Format an upcoming asynchronous RSX DMA transfer.
\param context Pointer to the context object
\param inpitch Pitch size, in bytes, of the source buffer (e.g., for a buffer that represents a rectangular image, this would be the width multiplied by the number of bytes in each pixel).
\param outpitch Pitch size, in bytes, of the destination buffer (e.g., for a buffer that represents a rectangular image, this would be the width multiplied by the number of bytes in each pixel).
\param linelength Size, in bytes, of each line of data that will be transfered.
\param linecount Number of lines of data to transfer.
\param inbytes Number of bytes for each block (e.g., pixel) of data to be transfered: 1, 2, or 4. Will perform scatter-gather transfer if different from outbytes.
\param outbytes Number of bytes for each block (e.g., pixel) of data to be transfered: 1, 2, or 4. Will perform scatter-gather transfer if different from inbytes.
*/
void rsxSetTransferDataFormat(gcmContextData *context,s32 inpitch,s32 outpitch,u32 linelength,u32 linecount,u8 inbytes,u8 outbytes);

/*! \brief Initiate an asynchronous RSX DMA transfer.
\param context Pointer to the context object
\param mode Specify source and destination memory areas. Possible values are:
- \ref GCM_TRANSFER_LOCAL_TO_LOCAL
- \ref GCM_TRANSFER_MAIN_TO_LOCAL
- \ref GCM_TRANSFER_LOCAL_TO_MAIN
- \ref GCM_TRANSFER_MAIN_TO_MAIN
\param dst Destination memory offset, e.g., a value returned by gcmAddressToOffset() or gcmMapMainMemory().
\param outpitch Pitch size, in bytes, of the destination buffer (e.g., for a buffer that represents a rectangular image, this would be the width multiplied by the number of bytes in each pixel).
\param src Source memory offset, e.g., a value returned by gcmAddressToOffset() or gcmMapMainMemory().
\param inpitch Pitch size, in bytes, of the source buffer (e.g., for a buffer that represents a rectangular image, this would be the width multiplied by the number of bytes in each pixel).
\param linelength Size, in bytes, of each line of data that will be transfered.
\param linecount Number of lines of data to transfer.
*/
void rsxSetTransferData(gcmContextData *context,u8 mode,u32 dst,u32 outpitch,u32 src,u32 inpitch,u32 linelength,u32 linecount);

/*! \brief Configure an upcoming asynchronous RSX blit.
\param context Pointer to the context object
\param mode Specify source and destination memory areas. Possible values are:
- \ref GCM_TRANSFER_LOCAL_TO_LOCAL
- \ref GCM_TRANSFER_MAIN_TO_LOCAL
- \ref GCM_TRANSFER_LOCAL_TO_MAIN
- \ref GCM_TRANSFER_MAIN_TO_MAIN
\param surface Transfer surface mode. Possible values are:
- \ref GCM_TRANSFER_SURFACE
- \ref GCM_TRANSFER_SWIZZLE
*/
void rsxSetTransferScaleMode(gcmContextData *context,const u8 mode,const u8 surface);

/*! \brief Initiate an asynchronous RSX blit.
\param context Pointer to the context object
\param scale Specify the transfer geometry & parameters.
\param surface Specify the surface to blit to.
*/
void rsxSetTransferScaleSurface(gcmContextData *context,const gcmTransferScale *scale,const gcmTransferSurface *surface);

/*! \brief Initialiate an asynchronous transfer of a rectangular image from one area of memory to another.
\param context Pointer to the context object
\param mode Specify source and destination memory areas. Possible values are:
- \ref GCM_TRANSFER_LOCAL_TO_LOCAL
- \ref GCM_TRANSFER_MAIN_TO_LOCAL
- \ref GCM_TRANSFER_LOCAL_TO_MAIN
- \ref GCM_TRANSFER_MAIN_TO_MAIN
\param dstOffset Destination memory offset, e.g., a value returned by gcmAddressToOffset() or gcmMapMainMemory().
\param dstPitch Pitch size, in bytes, of the destination image data (width multiplied by the number of bytes in each pixel).
\param dstX Origin of the destination data, relative to the beginning of the destination buffer.
\param dstY Origin of the destination data, relative to the beginning of the destination buffer.
\param srcOffset Source memory offset, e.g., a value returned by gcmAddressToOffset() or gcmMapMainMemory().
\param srcPitch Pitch size, in bytes, of the source image data (width multiplied by the number of bytes in each pixel).
\param srcX Origin of the source rectangle, relative to the beginning of the source buffer.
\param srcY Origin of the source rectangle, relative to the beginning of the source buffer.
\param width Width of the transfer rectangle.
\param height Height of the transfer rectangle.
\param bytesPerPixel Number of bytes per pixel to transfer: 2 or 4.
*/
void rsxSetTransferImage(gcmContextData *context,const u8 mode,const u32 dstOffset,const u32 dstPitch,const u32 dstX,const u32 dstY,const u32 srcOffset,const u32 srcPitch,const u32 srcX,const u32 srcY,const u32 width,const u32 height,const u32 bytesPerPixel);
void rsxSetTimeStamp(gcmContextData *context,u32 index);

#if 0
/*! \brief Unfinished 
*/
void rsxSetTransferScaleSwizzle(gcmContextData *context,const gcmTransferScale *scale,const gcmTransferSwizzle *swizzle);
#endif

#ifdef __cplusplus
	}
#endif

#endif
