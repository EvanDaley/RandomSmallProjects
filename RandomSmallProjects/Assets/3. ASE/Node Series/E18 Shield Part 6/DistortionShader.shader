// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "EvanDaley/ShieldPart6"
{
	Properties
	{
		_AnimationSpeed("AnimationSpeed", Range( 0 , 10)) = 0
		_AnimationScale("AnimationScale", Range( 0 , 0.1)) = 0
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard alpha:fade keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			fixed filler;
		};

		uniform float _AnimationSpeed;
		uniform float _AnimationScale;


		float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }

		float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }

		float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }

		float snoise( float2 v )
		{
			const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
			float2 i = floor( v + dot( v, C.yy ) );
			float2 x0 = v - i + dot( i, C.xx );
			float2 i1;
			i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
			float4 x12 = x0.xyxy + C.xxzz;
			x12.xy -= i1;
			i = mod2D289( i );
			float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
			float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
			m = m * m;
			m = m * m;
			float3 x = 2.0 * frac( p * C.www ) - 1.0;
			float3 h = abs( x ) - 0.5;
			float3 ox = floor( x + 0.5 );
			float3 a0 = x - ox;
			m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
			float3 g;
			g.x = a0.x * x0.x + h.x * x0.y;
			g.yz = a0.yz * x12.xz + h.yz * x12.yw;
			return 130.0 * dot( m, g );
		}


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_vertexNormal = v.normal.xyz;
			float simplePerlin2D20 = snoise( ( ase_vertexNormal + ( _Time.x * _AnimationSpeed ) ).xy );
			float3 temp_cast_1 = ((( _AnimationScale * -1.0 ) + (simplePerlin2D20 - 0.0) * (_AnimationScale - ( _AnimationScale * -1.0 )) / (1.0 - 0.0))).xxx;
			v.vertex.xyz += temp_cast_1;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=14201
795;92;846;665;1509.464;167.5109;1.6;True;False
Node;AmplifyShaderEditor.TimeNode;16;-1096.868,147.8899;Float;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;18;-1142.869,353.8897;Float;False;Property;_AnimationSpeed;AnimationSpeed;0;0;Create;0;6.9;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;15;-863.8664,-13.11024;Float;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;-807.8664,209.8899;Float;False;2;2;0;FLOAT;0.0;False;1;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;19;-631.8667,122.8898;Float;False;2;2;0;FLOAT3;0.0;False;1;FLOAT;0.0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;21;-698.5894,501.997;Float;False;Property;_AnimationScale;AnimationScale;1;0;Create;0;0.011;0;0.1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;23;-412.5503,298.1012;Float;False;2;2;0;FLOAT;0.0;False;1;FLOAT;-1.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;20;-474.2752,58.37711;Float;False;Simplex2D;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;22;-179.4971,302.8292;Float;False;5;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;1.0;False;3;FLOAT;0.0;False;4;FLOAT;1.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;EvanDaley/ShieldPart6;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;Back;0;0;False;0;0;Transparent;0.5;True;True;0;False;Transparent;Transparent;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;0;0;0;0;False;2;15;10;25;False;0.5;True;2;SrcAlpha;OneMinusSrcAlpha;0;Zero;Zero;OFF;OFF;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;FLOAT;0.0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;17;0;16;1
WireConnection;17;1;18;0
WireConnection;19;0;15;0
WireConnection;19;1;17;0
WireConnection;23;0;21;0
WireConnection;20;0;19;0
WireConnection;22;0;20;0
WireConnection;22;3;23;0
WireConnection;22;4;21;0
WireConnection;0;11;22;0
ASEEND*/
//CHKSM=43147599415EC9467D3AA201E6084E826463A26B