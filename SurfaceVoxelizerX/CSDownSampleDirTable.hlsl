//--------------------------------------------------------------------------------------
// By XU, Tianchen
//--------------------------------------------------------------------------------------

RWTexture3D<uint>	g_txGrid;
RWTexture3D<uint>	g_RWGrid;

groupshared uint	g_Block[2][2][2];

//--------------------------------------------------------------------------------------
// Down sampling
//--------------------------------------------------------------------------------------
[numthreads(2, 2, 2)]
void main(uint3 DTid : SV_DispatchThreadID, uint3 GTid : SV_GroupThreadID, uint3 Gid : SV_GroupID)
{
	uint uData = g_txGrid[DTid];
	g_Block[GTid.x][GTid.y][GTid.z] = uData;
	GroupMemoryBarrierWithGroupSync();

	/*g_Block[GTid.x][GTid.y][GTid.z] = GTid.x ? g_Block[GTid.x][GTid.y][GTid.z] + g_Block[GTid.x - 1][GTid.y][GTid.z] : g_Block[GTid.x][GTid.y][GTid.z];
	g_Block[GTid.x][GTid.y][GTid.z] = GTid.y ? g_Block[GTid.x][GTid.y][GTid.z] + g_Block[GTid.x][GTid.y - 1][GTid.z] : g_Block[GTid.x][GTid.y][GTid.z];
	g_Block[GTid.x][GTid.y][GTid.z] = GTid.z ? g_Block[GTid.x][GTid.y][GTid.z] + g_Block[GTid.x][GTid.y][GTid.z - 1] : g_Block[GTid.x][GTid.y][GTid.z];

	if (all(GTid))
	{
		vData = g_Block[GTid.x][GTid.y][GTid.z];
		g_RWGrid[0][Gid] = vData.x;
		g_RWGrid[1][Gid] = vData.y;
		g_RWGrid[2][Gid] = vData.z;
		g_RWGrid[3][Gid] = vData.w;
	}*/
}