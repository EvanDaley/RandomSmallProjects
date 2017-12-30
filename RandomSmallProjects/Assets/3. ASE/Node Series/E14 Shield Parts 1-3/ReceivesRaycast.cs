using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ReceivesRaycast : MonoBehaviour {

    public MeshRenderer renderer;
    public Material instancedMaterial;

    // Use this for initialization
    void Start () {
        renderer = gameObject.GetComponent<MeshRenderer>();
        instancedMaterial = renderer.material;
    }
	
	// Update is called once per frame
	void Update () {

    }

    public void SetHitPosition(Vector3 hitPosition)
    {
        Vector3 hitVector = gameObject.transform.InverseTransformPoint(hitPosition);
        instancedMaterial.SetVector("_HitPosition", hitVector);
    }
}
