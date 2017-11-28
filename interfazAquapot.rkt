#lang racket
(require racket/gui)
(require db)

(define (conexion)
(mysql-connect   #:server "localhost"
                 #:port 3306
                 #:database "aquabot"
                 #:user "root"
                 ))
;consulta de select
;(query-rows pgc "select * from persona")

;=============================VENTANA PRINCIPAL===========================

(define ventana (new frame%
                     [label "AQUABOT"]
                     [width 400]
                     [height 100]
                     ))
(define datos (new message%
                     [parent ventana]
                     [label ""]
                     [auto-resize #t]
                     ))

(define panel-botones-ventana (new horizontal-pane% [parent ventana]))
(define botonSeleccionar (new button%
                              [parent panel-botones-ventana]
                              [label "SELECCIONAR USUARIO"]
                              [callback (lambda (b c)
                                          (send ventana-seleccionar show #t))]))

(define boton-Registrar
  (new button%
       [parent panel-botones-ventana]
       [label "REGISTRAR USUARIO"]
       [callback
        (lambda (b c)
          (send ventana-registro show #t)
          )
        ])

  )
(send ventana show #t)

;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;INSERTAR UNA PERSONA
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;===========================VENTANA REGISTRO=============================
(define ventana-registro (new dialog%
                              [label "REGISTRO USUARIO"]
                              [stretchable-width #f]
                              [stretchable-height #f]))
;(define panel-registro (new vertical-pane%) [parent ventana-registro])

(define txt-cedula (new text-field%
                        [label "Cedula :"]
                        [parent ventana-registro]
                        ))

(define txt-nombre (new text-field%
                         [label "Nombre :"]
                         [parent ventana-registro]
                         ))

(define txt-apellido (new text-field%
                          [label "Apellido :"]
                          [parent ventana-registro]
                          ))

(define txt-fechaNacimiento (new text-field%
                          [label "Fecha Nacimiento :"]
                          [parent ventana-registro]
                          ))

#|(define radio-Genero (new radio-box%
                    [label "Genero "]
                    [parent ventana-registro]
                    [choices (list "Masculino" "Femenino")]
                    
                    ))
|#
(define combo-Genero (new combo-field%
                          [label "Genero "]
                          [parent ventana-registro]
                          [choices (list "Masculino" "Femenino")]
                          ))


(define combo-nivelEstudio (new combo-field%
                          [label "Nivel eduacion "]
                          [choices (list "basica" "secundaria" "superior")]
                          [parent ventana-registro]
                          
                          ))


(define combo-estrato (new combo-field%
                      [label "Estrato "]
                      [choices (list "1" "2" "3" "4" "5" "6")]
                      [parent ventana-registro]
                      ))

(define combo-num-personas (new combo-field%
                                [label "Num personas vivienda "]
                                [choices (list "1" "2" "3" "4" "5" "6" "7" "8" "9")]
                                [parent ventana-registro]))

(define combo-Ciudad (new combo-field%
                          [label "Ciudad "]
                          [choices (list "popayan" "cali" "bogota")]
                          [parent ventana-registro]))

(define botonRegistrar(new button%
                           [parent ventana-registro]
                           [label "REGISTRAR"]
                           [callback (lambda ( b c)
                                       ( verificar-usuario (parsear(send txt-cedula get-value))))]))

;===========================CONFIRMACION DE REGISTRO=====================
(define ventana-exito (new frame% [label "CARGANDO..."]))
(define mensaje-exito (new message% [parent ventana-exito] [label "OPERACION EXITOSA!!!"]))
(send ventana-exito show #f)

(define boton-exito (new button%
                         [label "ACEPTAR"]
                         [parent ventana-exito]
                         [callback (lambda (b c)
                                     (send  ventana-registro show #f))]))

(define ventana-error-reg (new frame% [label "ERROR"]))
(define mensaje-error-reg (new message% [parent ventana-error-reg][label "USUARIO YA INGRESADO"]))
(new button% [parent ventana-error-reg][label "ACEPTAR"][callback (lambda (b c)
                                                                    (send ventana-registro show #t))])
;===========================VERIFICAR USUARIO====================================
(define (verificar-usuario valor)
  (if (empty? (query-list (conexion)"SELECT perCedula FROM persona WHERE perCedula =?" valor))
      (let((band 0))(registrar) (send ventana-exito show #t))
      (send ventana-error-reg show #t)
      )
)
;logica parsear datos
(define (parsear dato)
  (if (string? dato)
      dato
      (number->string dato))
  )

(define (registrar)
  (query(conexion) "INSERT INTO `persona`( `perCedula`,  `perNombres`, `perApellidos`,`perFechaNacimiento`, `perSexo`, `perEstrato`,
`perEstudios`, `perNumPersonasVivienda` ,`perCiudad`) VALUES (?,?,?,?,?,?,?,?,?)"
 (send txt-cedula get-value) (send txt-nombre get-value) (send txt-apellido get-value)  (send txt-fechaNacimiento get-value) (send combo-Genero get-value)
 (send combo-estrato get-value )(send combo-nivelEstudio get-value)(send combo-num-personas get-value) (send combo-Ciudad get-value)       
))
#|
(define regi (string-append "INSERT INTO PERSONA (`perCedula`, `perNombres`, `perApellidos`,
`perFechaNacimiento`, `perSexo`, `perEstrato`, `perEstudios`, `perNumPersonasVivienda`)
VALUES ("(number->string cedula)",'"(symbol->string nombres)"','"(symbol->string apellidos)"',
'"(symbol->string fechaNacimiento)"','"(symbol->string genero)"',"(number->string estrato)",'"(symbol->string estudios)"',"(number->string familiares)")"))
(query-exec pgc consultaInsertPersona)
|#
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;INSERTAR UN CONSUMO
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#|
(query-rows (conexion) "select perCedula, perSexo, perEstrato from persona")

(define consumoMensual(read))
(define fechaConsumo(read))
(define cedulaI(read))

(define consultaInsertConsumo (string-append "INSERT INTO CONSUMOMENSUAL (`comConsumoMensual`, `comFecha`, `comCedula`)
VALUES ("(number->string consumoMensual)",'"(symbol->string fechaConsumo)"',"(number->string cedulaI)")"))
(query-exec pgc consultaInsertConsumo)
|#
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;LÓGICA GENERAR RECIBO
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////







;============================VENTANA SELECCIONAR USUARIO=================

(define ventana-seleccionar (new dialog%
                                 [label "SELECCIONAR USUARIO"]))

(define panel-opciones-horizontal (new horizontal-pane% [parent ventana-seleccionar]))
(define panel-opciones-vertical (new vertical-pane% [parent ventana-seleccionar]))

(define choice-seleccionar-usuario (new choice%
                      [label "Usuario"]
                      [choices (list "usuario 1" "usuario 2")]
                      [parent panel-opciones-horizontal]
                    
                      ))
(define ventana-mostrar (new frame%
                             [label "DATOS PERSONALES"]))
(define mostrar-nombre (new text-field% [parent ventana-mostrar][label "nombre "]) )
(define mostrar-apellido (new text-field% [parent ventana-mostrar][label "apellido "]))
(define mostrar-fecha (new text-field% [parent ventana-mostrar][label "fecha Nacimiento "]))
(define mostrar-Genero (new text-field% [parent ventana-mostrar][label "Genero "]))
(define mostrar-Estrato (new text-field% [parent ventana-mostrar][label "Estrato "]))
(define mostrar-Estudio (new text-field% [parent ventana-mostrar][label "Nivel Estudio "]))
(define mostrar-num-Personas (new text-field% [parent ventana-mostrar][label "Num personas "]))
(define mostrar-ciudad (new text-field% [parent ventana-mostrar][label "Ciudad"]))
;logica cargar datos

(define (cargar valor)
  (call-with-transaction (conexion)
                         (lambda ()
                           (for ([(a b)
                                  (in-query (conexion) "SELECT perNombres, perApellidos, perFechaNacimiento, perSexo, perEstrato, perEstudios, perNumPersonasVivienda, perCiudad
                                   FROM persona WHERE perCedula = ?" valor
                                  #:fetch 1)])
                             (llenar a b c d e f g h i)
                             ))))
;llenar datos
(define (llenar a b c d e f g h i))
(send )
;logica buscar usuario
#|(define (buscar valor)
  (if(empty? (query-list (conexion)"SELECT perCedula FROM persona WHERE perCedula=?" valor))))
|#
(define botonMostrar (new button%
                          [parent panel-opciones-horizontal]
                          [label "MOSTRAR"]
                          [callback (lambda (b c)
                                      (send ventana-registro show #t))]));llamar mostrar informacion pendiente
(define botonGenerarRecibo (new button%
                                [parent panel-opciones-vertical]
                                [label "GENERAR RECIBO"]
                                [callback (lambda (b c)
                                            (send ventana-registro show #t))]) );llamar generar recibo pendiente
(define boton-Reg-Cons (new button%
                           [parent panel-opciones-vertical]
                           [label "REGISTRAR CONSUMO"]
                           [callback (lambda (b c)
                                       (send ventana-registro show #t))])); llamar a calcular PENDIENTE!!!
(define ventana-reg-cons (new dialog%
                              [label "REGISTRAR CONSUMO"]))

#|(define botonRegistrarConsumo(new button%
                           [parent ventana-reg-cons]
                           [label "REGISTRAR CONSUMO"]
                           [callback (lambda ( b c)
                                       ( mostrar-consumos (parsear(send txt-cedula get-value))))]))

|#
;(define (mostrar) )
(define ventana-recibo (new dialog%
                            [label "RECIBO"]))



(define mensaje (new message%
                     [label ""]
                     [parent ventana]
                     [auto-resize #t]
                     ))


