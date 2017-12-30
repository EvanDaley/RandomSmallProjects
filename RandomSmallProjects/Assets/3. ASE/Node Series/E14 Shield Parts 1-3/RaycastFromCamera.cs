using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RaycastFromCamera : MonoBehaviour {

    Ray ray;

    // Use this for initialization
    void Start () { 

	}
	
	// Update is called once per frame
	void Update () {
        if (Input.GetMouseButtonDown(0))
        {
            ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;
            if (Physics.Raycast(ray, out hit, 100f))
            {
                ReceivesRaycast ReceivesRaycast = hit.collider.gameObject.GetComponent<ReceivesRaycast>();
                if (ReceivesRaycast)
                {
                    ReceivesRaycast.SetHitPosition(hit.point);
                } 
            }
        }
	}
}
