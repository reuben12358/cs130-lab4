varying vec4 position;
varying vec3 normal;
varying vec3 light_direction;

void main()
{
    vec4 ambient = vec4(0, 0, 0, 0);
    vec4 diffuse = vec4(0, 0, 0, 0);
    vec4 specular = vec4(0, 0, 0, 0);
	ambient = gl_LightModel.ambient * gl_FrontMaterial.ambient;

    //for (int i = 0; i < gl_MaxLights; ++i) {
	diffuse = max(dot(light_direction,normal),0.0) * gl_LightSource[0].diffuse * gl_FrontMaterial.diffuse;
	
	vec3 r = 2.0 * dot(light_direction, normal) * normal - light_direction;
	specular = gl_FrontMaterial.specular * gl_LightSource[0].specular * pow(max(dot(vec4(r,0),-position), 0.0), gl_FrontMaterial.shininess);

	//}
     gl_FragColor = ambient + diffuse + specular;
}
