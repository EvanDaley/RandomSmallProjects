// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "EvanDaley/CameraDepthFade"
{
	Properties
	{
		_Offset("Offset", Range( 0 , 100)) = 0
		_Length("Length", Float) = 0
		_TextureSample0("Texture Sample 0", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IgnoreProjector" = "True" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha noshadow exclude_path:deferred vertex:vertexDataFunc 
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
			float clampResult9 = clamp( cameraDepthFade1 , 0.0 , 2.0 );
			o.Albedo = ( tex2D( _TextureSample0, uv_TextureSample0 ) + clampResult9 ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=13901
49;63;1586;830;1231.932;353.8518;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;2;-912.959,254.8271;Float;False;Property;_Offset;Offset;0;0;0;0;100;0;1;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;3;-878.959,125.8271;Float;False;Property;_Length;Length;1;0;0;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.CameraDepthFade;1;-596.5797,124.8954;Float;False;2;0;FLOAT;1.0;False;1;FLOAT;0.0;False;1;FLOAT
Node;AmplifyShaderEditor.SamplerNode;4;-584.959,-283.1729;Float;True;Property;_TextureSample0;Texture Sample 0;2;0;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.ClampOpNode;9;-291.959,11.82709;Float;False;3;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;2.0;False;1;FLOAT
Node;AmplifyShaderEditor.SimpleSubtractOpNode;7;-380.959,214.8271;Float;False;2;0;FLOAT;0.0;False;1;FLOAT;0.0;False;1;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;8;-580.959,344.8271;Float;False;Constant;_Float0;Float 0;3;0;1;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.SimpleAddOpNode;10;-87.95898,-102.1729;Float;False;2;2;0;COLOR;0.0;False;1;FLOAT;0,0,0,0;False;1;COLOR
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;159,-126;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;EvanDaley/CameraDepthFade;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;Back;0;0;False;0;0;Opaque;0.5;True;False;0;True;Opaque;Geometry;ForwardOnly;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;0;0;0;0;False;2;15;10;25;False;0.5;False;0;SrcAlpha;OneMinusSrcAlpha;0;Zero;Zero;OFF;OFF;0;False;0;0,0,0,0;VertexOffset;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;0;0;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;FLOAT;0.0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;1;0;3;0
WireConnection;1;1;2;0
WireConnection;9;0;1;0
WireConnection;7;0;8;0
WireConnection;7;1;1;0
WireConnection;10;0;4;0
WireConnection;10;1;9;0
WireConnection;0;0;10;0
ASEEND*/
//CHKSM=E622EEDA919B7FAECF93572C7CB6497C0AD41623