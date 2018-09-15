//--------------------------------------------------------------------------------------
// By XU, Tianchen
//--------------------------------------------------------------------------------------

#include "SharedConst.h"
#include "PSTriProj.hlsli"
#include "PSDepthPeel.hlsli"

void main(const PSIn input)
{
	const uint3 vLoc = input.TexLoc * g_fGridSize;
	
	PSTriProj(input, vLoc);
	DepthPeel(vLoc.z, vLoc.xy, g_fGridSize * DEPTH_SCALE);
}
