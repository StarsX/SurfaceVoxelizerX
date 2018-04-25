//--------------------------------------------------------------------------------------
// By XU, Tianchen
//--------------------------------------------------------------------------------------

#include "SharedConst.h"

struct PSIn
{
	float4	Pos		: SV_POSITION;
	float3	PosLoc	: POSLOCAL;
	float3	Nrm		: NORMAL;
	float3	TexLoc	: TEXLOCATION;
};

RWTexture3D<unorm min16float4> g_RWGrid;

void main(PSIn input)
{
	const uint3 vLoc = input.TexLoc * GRID_SIZE;

	const min16float3 vNorm = min16float3(normalize(input.Nrm));
	g_RWGrid[vLoc] = min16float4(vNorm * 0.5 + 0.5, 1.0);
}
