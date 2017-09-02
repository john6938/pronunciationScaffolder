module Components.App.View exposing (..)

import Components.App.Annotator exposing (annotators)
import Components.App.AnnotatorToggleView exposing (annotatorToggle)
import Components.App.Constants exposing (viewPhrases)
import Components.App.Model exposing (Model)
import Components.App.Msg exposing (..)
import Html exposing (Html, button, div, h1, h2, p, text, textarea)
import Html.Attributes exposing (class, id, value)
import Html.Events exposing (onClick, onInput)


view : Model -> Html Msg
view model =
    div [ class "main-frame" ]
        [ viewPageTitle
        , viewAnnotatorButtons model
        , viewSpeakingButton
        , viewInputArea
        , viewResultArea
        ]


viewPageTitle : Html Msg
viewPageTitle =
    h2 [ class "page-title" ]
        [ text viewPhrases.pageTitle
        ]


viewAnnotatorButtons : Model -> Html Msg
viewAnnotatorButtons model =
    div [ class "annotator-buttons" ] <|
        List.map (flip annotatorToggle <| model) annotators


viewSpeakingButton : Html Msg
viewSpeakingButton =
    button [ onClick SpeakInputText ] [ text "Speak" ]


viewInputArea : Html Msg
viewInputArea =
    div [ class "input-area" ]
        [ textarea [ id "input", value "", onInput (\_ -> ApplyMultiAnnotations) ] []
        ]


viewResultArea : Html Msg
viewResultArea =
    div [ class "result-area" ]
        [ p [ id "result" ] []
        ]
