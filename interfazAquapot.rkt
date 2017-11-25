#lang racket
(require racket/gui)
#|
(define ventana (new frame% [label "hola mundo"]))
#|(define mensaje (new message% [parent ventana]
                     [label "bla bla bla bla"]))|#
#(send ventana show #t)



(define (funcion-manejadora b c)
  (if (object=? b boton1)
      (send mensaje set-label "se presiono el boton 1")
      (send mensaje set-label "se presiono el boton 2")
      )
  )

(define boton1 (new button%
                    [parent ventana]
                    [label "boton 1"]
                    [callback funcion-manejadora]
                    ))
(define mensaje (new message% [parent ventana]
                     [label "aun no se a presionadi ningun boton"]))
(define boton2 (new button%
                    [parent ventana]
                    [label "boton 2"]
                    [callback funcion-manejadora]
                    ))
(send ventana show #t)
|#
;=============================VENTANA PRINCIPAL===========================

(define ventana (new frame% [label "AQUABOT"]))
(define datos (new message%
                     [parent ventana]
                     [label ""]
                     [auto-resize #t]
                     ))
(define ventana-registro (new dialog%
                              [label "REGISTRO USUARIO"]))

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

;============================VENTANA SELECCIONAR USUARIO=================

(define ventana-seleccionar (new dialog%
                                 [label "SELECCIONAR USUARIO"]))

(define (usuario r c)     ;instancia la lista y control-evento
  (send mensaje set-label
        (string-append "opcion lista"
                       (number->string (send r get-selection))
                       "con texto"
                       (send r get-string-selection)
                       "de la lista"
                       (let ([t (send r get-label)])
                         (if t t "<sin-texto>"))
                       "'"
                       ))
  )
(define choice-seleccionar-usuario (new choice%
                      [label "Usuario"]
                      [choices (list "usuario 1" "usuario 2")]
                      [parent ventana-seleccionar]
                      [callback usuario]
                      ))
(define botonSeleccionar (new button%
                              [parent ventana]
                              [label "SELECCIONAR USUARIO"]
                              [callback (lambda (b c)
                                          (send ventana-seleccionar show #t))]))
(define botonMostrar (new button%
                          [parent ventana-seleccionar]
                          [label "MOSTRAR"]
                          [callback (lambda (b c)
                                      (send ventana-registro show #t))]));llamar mostrar informacion pendiente
(define botonGenerarRecibo (new button%
                                [parent ventana-seleccionar]
                                [label "GENERAR RECIBO"]
                                [callback (lambda (b c)
                                            (send ventana-registro show #t))]) );llamar generar recibo pendiente
(define botonCalcular (new button%
                           [parent ventana-seleccionar]
                           [label "CALCULAR"]
                           [callback (lambda (b c)
                                       (send ventana-registro show #t))])); llamar a calcular PENDIENTE!!!
(define ventana-calcular (new dialog%
                              [label "CALCULAR"]))

(define ventana-recibo (new dialog%
                            [label "RECIBO"]))

(define Registrar
  (new button%
       [parent ventana]
       [label "REGISTRAR USUARIO"]
       [callback
        (lambda (b c)
          (send ventana-registro show #t)
          #|(send datos set-label
                (string-append "Nombre : '"
                               (send txt-nombre get-value)
                               "', Apellido :'"
                               (send txt-apellido get-value)
                               "', Fecha Nacimiento :'"
                               (send txt-fechaNacimiento get-value)
                               "',Genero :'"
                               (send radio-Genero get-value)
                               "',Estrato :"
                               (send choice-estrato get-value)
                               ""
                               (send choice-nivelEstudio get-value)
                               ""
                               )
                )|#)
        ])

  )



(define (Genero r c)
  (send mensaje set-label
        (string-append "se marco la opcion"
                       (number->string (send r get-selection))
                       "con texto"
                       (send r get-item-label (send r get-selection))
                       "del grupo"
                       (let ([t (send r get-label)])
                         (if t t "<sin-text>"))
                       "'"))
  )

(define (Estrato r c)     ;instancia la lista y control-evento
  (send mensaje set-label
        (string-append "opcion lista"
                       (number->string (send r get-selection))
                       "con texto"
                       (send r get-string-selection)
                       "de la lista"
                       (let ([t (send r get-label)])
                         (if t t "<sin-texto>"))
                       "'"
                       ))
  )

(define (nivelEstudio r c)
  (send mensaje set-label
        (string-append "opcion lista"
                       (number->string (send r get-selection))
                       "con texto"
                       (send r get-string-selection)
                       "de la lista"
                       (let ([t (send r get-label)])
                         (if t t "<sin-texto>"))
                       "'"
                       ))
  )

(define choice-nivelEstudio (new choice%
                          [label "Nivel eduacion "]
                          [choices (list "basica" "secundaria" "superior")]
                          [parent ventana-registro]
                          [callback nivelEstudio]))

(define choice-estrato (new choice%
                      [label "Estrato "]
                      [choices (list "1" "2" "3" "4" "5" "6")]
                      [parent ventana-registro]
                      [callback Estrato]
                      ))

(define radio-Genero (new radio-box%
                    [label "Genero "]
                    [parent ventana-registro]
                    [choices (list "Masculino" "Femenino")]
                    [callback Genero]
                    ))

(define mensaje (new message%
                     [label ""]
                     [parent ventana]
                     [auto-resize #t]
                     ))

(define botonRegistrar(new button%
                           [parent ventana-registro]
                           [label "REGISTRAR"]
                           [callback (lambda ( b c)
                                       (send ventana-registro show #t))]))


#|(define panel (new horizontal-panel% [parent ventana]))
(new button% [parent ventana-registro]
     [label "INSERTAR USUARIO"]
     [callback (lambda (button event)
                 (send mensaje set-label ""))])
|#

#|(new button% [parent panel]
     [label "SELECCIONAR USUARIO"]
     [callback (lambda (button event)
                 (send mensaje set-label ""))])
|#

(send ventana show #t)