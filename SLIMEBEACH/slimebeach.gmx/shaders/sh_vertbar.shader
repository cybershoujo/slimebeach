//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;

              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vPosition;
varying vec2 v_FragCoord;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    
    v_vPosition = in_Position;   
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    v_FragCoord = in_Position.xy;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple mask
//

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vPosition;
varying vec2 v_FragCoord;

uniform float content;
uniform float maxContent;
uniform float yy;
uniform sampler2D mask;

void main()
{

    vec4 maskLayer = texture2D(mask, v_FragCoord.xy);

    if(yy - v_FragCoord.y < content * (yy/maxContent)) {
//    if(maskLayer.r < (content/maxContent)) {
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord.xy);
    } else {
    gl_FragColor = vec4(0.0, 0.0, 0.0, 0.0);
    }
}
