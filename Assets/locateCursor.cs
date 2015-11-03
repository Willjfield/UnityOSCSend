using UnityEngine;
using System.Collections;

public class locateCursor : MonoBehaviour {
	// Use this for initialization
	Vector3 curPos = new Vector3();
	GameObject curCanvas; 
	float curX,curY;
	void Start () {
		curCanvas = GameObject.Find("MainGUI");
	}
	
	// Update is called once per frame
	void Update () {
		if (Input.touchCount>0) {
			curX = Input.GetTouch (0).position.x; 
			curY = Input.GetTouch (0).position.y;
		} else {
			curX = Input.mousePosition.x;
			curY = Input.mousePosition.y;
		}
		float curZ = 0;
		curPos.Set (curX, curY, curZ);
		transform.localPosition = curPos - curCanvas.transform.localPosition;
		//ImagePosition.rectTransform.anchoredPosition = new Vector2(Input.mousePosition.x, Input.mousePosition.y);
	}
}
