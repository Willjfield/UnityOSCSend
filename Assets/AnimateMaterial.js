var scrollSpeed : float = .001;
var offset : float;

function Update(){
	offset+=(Time.deltaTime*scrollSpeed)/560.0;
	Debug.Log(Time.time);
	GetComponent.<Renderer>().material.SetTextureOffset("_MainTex", Vector2(offset,0));
}