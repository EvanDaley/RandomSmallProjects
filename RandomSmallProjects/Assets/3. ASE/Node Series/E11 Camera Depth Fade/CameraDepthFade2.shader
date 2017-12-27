// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "EvanDaley/CameraDepthFade2"
{
	Properties
	{
		_Length("Length", Float) = 2
		_Offset("Offset", Range( 0 , 30)) = 70
		_TextureSample0("Texture Sample 0", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Geometry+0" "IgnoreProjector" = "True" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			float2 uv_texcoord;
			float eyeDepth;
		};

		uniform sampler2D _TextureSample0;
		uniform float4 _TextureSample0_ST;
		uniform float _Length;
		uniform float _Offset;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			o.eyeDepth = -UnityObjectToViewPos( v.vertex.xyz ).z;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_TextureSample0 = i.uv_texcoord * _TextureSample0_ST.xy + _TextureSample0_ST.zw;
			float cameraDepthFade1 = (( i.eyeDepth -_ProjectionParams.y - _Offset ) / _Length);
			float clampResult6 = clamp( cameraDepthFade1 , 0.0 , 3.0 );
			o.Albedo = ( tex2D( _TextureSample0, uv_TextureSample0 ) + clampResult6 ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=13901
49;63;1586;830;1376.645;270.8223;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;3;-908.5447,238.9898;Float;False;Property;_Offset;Offset;2;0;70;0;30;0;1;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;2;-831.5447,85.98984;Float;False;Property;_Length;Length;1;0;2;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.CameraDepthFade;1;-594.5446,169.9898;Float;False;2;0;FLOAT;1.0;False;1;FLOAT;0.0;False;1;FLOAT
Node;AmplifyShaderEditor.ClampOpNode;6;-374.6451,121.1777;Float;False;3;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;3.0;False;1;FLOAT
Node;AmplifyShaderEditor.SamplerNode;4;-574.5447,-216.0102;Float;True;Property;_TextureSample0;Texture Sample 0;3;0;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.SimpleAddOpNode;5;-244.6451,1.177734;Float;False;2;2;0;COLOR;0.0;False;1;FLOAT;0,0,0,0;False;1;COLOR
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;EvanDaley/CameraDepthFade2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;Back;0;0;False;0;0;Custom;0.5;True;True;0;False;Transparent;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;0;0;0;0;False;2;15;10;25;False;0.5;True;0;Zero;Zero;0;Zero;Zero;OFF;OFF;0;False;0;0,0,0,0;VertexOffset;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;0;0;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;FLOAT;0.0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;1;0;2;0
WireConnection;1;1;3;0
WireConnection;6;0;1;0
WireConnection;5;0;4;0
WireConnection;5;1;6;0
WireConnection;0;0;5;0
ASEEND*/
//CHKSM=48EBEBA43972C0854F27B0870066C556890BD12A