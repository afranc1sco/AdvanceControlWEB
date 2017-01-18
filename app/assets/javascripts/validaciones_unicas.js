$(document).on("ready page:load", function() {

$(".activox").validate({
debug: true,
rules: {
"activo[CB]": {required: true, remote:'activos/activos_check_cb' }
}
});

$(".ruta-validado").validate({
debug: true,
rules: {
"ruta[Ruta]": {required: true, remote:'rutas/rutas_check' }
}
});


$(".vendedor-validado").validate({
debug: true,
rules: {
"vendedor[Clave]": {required: true, remote:'vendedores/vendedores_check' }
}
});

$(".vehiculo-validado").validate({
debug: true,
rules: {
"vehiculo[Clave]": {required: true, remote:'vehiculos/vehiculos_check' }
}
});

$(".cliente-validado").validate({
debug: true,
rules: {
"cliente[IdCli]": {required: true, remote:'clientes/clientes_check' }
}
});

$(".producto-validado").validate({
debug: true,
rules: {
"producto[Clave]": {required: true, remote:'productos/productos_check' }
}
});

$(".promocion-validado").validate({
debug: true,
rules: {
"listaprom[Lista]": {required: true, remote:'listapromo/promociones_check' }
}
});

$(".mvmerma-validado").validate({
debug: true,
rules: {
"mvmerma[Clave]": {required: true, remote:'mvomerma/mvomerma_check' }
}
});

$(".formapag-validado").validate({
debug: true,
rules: {
"formapag[Clave]": {required: true, remote:'formaspag/formaspag_check' }
}
});

$(".motivonoventa-validado").validate({
debug: true,
rules: {
"motivonoventa[Clave]": {required: true, remote:'motivosnoventa/motivosnoventa_check' }
}
});

$(".mvodevolucion-validado").validate({
debug: true,
rules: {
"mvodevolucion[Clave]": {required: true, remote:'mvodev/mvodev_check' }
}
});

$(".usuario-validado").validate({
debug: true,
rules: {
"usuario[usuario]": {required: true, remote:'usuarios/usuarios_check' },
"usuario[email]": {required: true, remote:'usuarios/usuarios_check2' }
}
});

$(".empresamadre-validado").validate({
debug: true,
rules: {
"empresamadre[id]": {required: true, remote:'empresasmadre/empresasmadre_check' }
}
});

$(".empresa-validado").validate({
debug: true,
rules: {
"empresa[IdEmpresa]": {required: true, remote:'/empresa/empresas_check' }
}
});


});
