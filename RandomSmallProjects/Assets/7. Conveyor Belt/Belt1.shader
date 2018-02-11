// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "EvanDaley/Belt1"
{
	Properties
	{
		_AnimationSpeed("AnimationSpeed", Vector) = (0,0,0,0)
		_TextureSample1("Texture Sample 1", 2D) = "white" {}
		_DiffuseColor("DiffuseColor", Color) = (0.2586207,0.2586207,0.2586207,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float4 _DiffuseColor;
		uniform sampler2D _TextureSample1;
		uniform float2 _AnimationSpeed;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_TexCoord3 = i.uv_texcoord * float2( 1,1 ) + float2( 0,0 );
			float2 panner2 = ( uv_TexCoord3 + _Time.y * _AnimationSpeed);
			o.Albedo = ( _DiffuseColor * tex2D( _TextureSample1, panner2 ) ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=14201
855;92;746;547;1534.286;638.0323;2.725278;True;False
Node;AmplifyShaderEditor.SimpleTimeNode;5;-920.8267,255.1716;Float;False;1;0;FLOAT;1.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;4;-907.8267,87.17155;Float;False;Property;_AnimationSpeed;AnimationSpeed;0;0;Create;0,0;-1,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.TextureCoordinatesNode;3;-961.8267,-60.82845;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;2;-649.4266,32.57155;Float;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1.0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ColorNode;11;-339.8711,-76.84316;Float;False;Property;_DiffuseColor;DiffuseColor;2;0;Create;0.2586207,0.2586207,0.2586207,0;0.1689655,0.1689655,0.1689655,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;9;-420.4992,122.8939;Float;True;Property;_TextureSample1;Texture Sample 1;1;0;Create;None;fceaa59d0b2223a42b6420b8eac0f506;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;-67.96047,84.1387;Float;False;2;2;0;COLOR;0.0,0,0,0;False;1;COLOR;0.0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;132.9,-11.7;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;EvanDaley/Belt1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;0;False;0;0;Opaque;0.5;True;True;0;False;Opaque;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;0;0;0;0;False;2;15;10;25;False;0.5;True;0;Zero;Zero;0;Zero;Zero;OFF;OFF;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;FLOAT;0.0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;2;0;3;0
WireConnection;2;2;4;0
WireConnection;2;1;5;0
WireConnection;9;1;2;0
WireConnection;10;0;11;0
WireConnection;10;1;9;0
WireConnection;0;0;10;0
ASEEND*/
//CHKSM=9589581AF4612576DF7BAFC30E80DA8AB2CC1358