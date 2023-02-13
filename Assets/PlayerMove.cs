using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMove : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    public float speed;
    void Update()
    {
        float horizontal = Input.GetAxis("Horizontal");
        float vetical = Input.GetAxis("Vertical");
        transform.position += new Vector3(horizontal*speed*Time.deltaTime,vetical*speed*Time.deltaTime,0);
    }
}
