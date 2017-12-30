// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "EvanDaley/ShieldPart4"
{
	Properties
	{
		_TextureSample0("Texture Sample 0", 2D) = "white" {}
		_ShieldPatternScale("Shield Pattern Scale", Range( 0 , 5)) = 0
		_TimeScale("Time Scale", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard alpha:fade keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _TextureSample0;
		uniform float _ShieldPatternScale;
		uniform float _TimeScale;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 appendResult4 = (float4(_ShieldPatternScale , _ShieldPatternScale , 0.0 , 0.0));
			float mulTime5 = _Time.y * _TimeScale;
			float4 appendResult8 = (float4(0.0 , mulTime5 , 0.0 , 0.0));
			float2 uv_TexCoord3 = i.uv_texcoord * appendResult4.xy + appendResult8.xy;
			o.Albedo = tex2D( _TextureSample0, uv_TexCoord3 ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=14201
1742;59;1666;984;1783;443.3517;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;6;-1431,283.6483;Float;False;Property;_TimeScale;Time Scale;2;0;Create;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2;-1266,-208.5;Float;False;Property;_ShieldPatternScale;Shield Pattern Scale;1;0;Create;0;4.17;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;5;-1147,105.6483;Float;False;1;0;FLOAT;1.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1214,-25.35172;Float;False;Constant;_Float0;Float 0;3;0;Create;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;8;-925.0005,27.64828;Float;False;FLOAT4;4;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;0.0;False;3;FLOAT;0.0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.DynamicAppendNode;4;-926,-148.5;Float;False;FLOAT4;4;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;0.0;False;3;FLOAT;0.0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3;-696,-18.5;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-374,-29.5;Float;True;Property;_TextureSample0;Texture Sample 0;0;0;Create;5798ded558355430c8a9b13ee12a847c;5798ded558355430c8a9b13ee12a847c;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;71,-71;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;EvanDaley/ShieldPart4;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;Back;0;0;False;0;0;Transparent;0.5;True;True;0;False;Transparent;Transparent;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;0;0;0;0;False;2;15;10;25;False;0.5;True;2;SrcAlpha;OneMinusSrcAlpha;0;Zero;Zero;OFF;OFF;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;FLOAT;0.0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;5;0;6;0
WireConnection;8;0;7;0
WireConnection;8;1;5;0
WireConnection;4;0;2;0
WireConnection;4;1;2;0
WireConnection;3;0;4;0
WireConnection;3;1;8;0
WireConnection;1;1;3;0
WireConnection;0;0;1;0
ASEEND*/
//CHKSM=7E7BE175EFD05BB2715BAE7054680E76CD152C0B