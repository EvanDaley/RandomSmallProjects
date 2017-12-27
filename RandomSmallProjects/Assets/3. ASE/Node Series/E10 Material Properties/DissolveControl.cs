using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DissolveControl : MonoBehaviour {

    public Renderer meshRenderer;
    public Material instancedMaterial;

	// Use this for initialization
	void Start () {
        meshRenderer = gameObject.GetComponent<Renderer>();
        instancedMaterial = meshRenderer.material;
    }
	
	// Update is called once per frame
	void Update () {
        float dissolveAmount = Input.GetAxis("Horizontal");
        instancedMaterial.SetFloat("_DissolveAmount", dissolveAmount);
    }
}
