varying vec4 position;
varying vec3 normal;
varying vec3 light_direction;

void main()
{
    // vec4 ambient = vec4(1, 0, 0, 1);
    vec4 diffuse = vec4(0, 1, 0, 1);
    vec4 specular = vec4(0, 0, 1, 1);

	gl_FragColor = gl_LightModel.ambient + gl_FrontMaterial.ambient;

    for (int i = 0; i < gl_MaxLights; ++i) {
	float diff = max(dot(light_direction,normal),0.0);	
	diffuse= diff*gl_LightSource[i].diffuse;
	gl_FragColor += diffuse*gl_FrontMaterial.diffuse;

	vec4 r = (2.0*dot(-position, vec4(normal,0)) * vec4(normal,0)) + position;
	gl_FragColor += gl_FrontMaterial.specular * gl_LightSource[i].specular * pow(max(dot(r,position), 0.0), gl_FrontMaterial.shininess);

	}
    // gl_FragColor = ambient + diffuse + specular;
}
