#!ruby
# frozen_string_literal: true

require 'erb'
require 'yaml'
require 'json'

questions = YAML.load_file(File.expand_path('../questions.yml', __dir__))

categories = questions.reduce([]) do |list, item|
  next(list) if list.include? item['category']
  list << item['category']
end

template_renderer = ERB.new(DATA.read)
puts template_renderer.result

__END__

<p align="center">
  <img src="./1on1-meeting-questions-logo.png">
  <p align="center">Lista de perguntas para reuniões 1-on-1</p>

  <p align="center">
    <a href="#">
      <img src="https://img.shields.io/badge/made%20with-%E2%9D%A4-blue">
    </a>
    <a href="https://github.com/GouveaHeitor/nipe/blob/master/LICENSE.md">
      <img src="https://img.shields.io/badge/license-MIT-blue.svg">
    </a>
  </p>
</p>

Este projeto pretende manter uma lista de perguntas que podem ser utilizadas em reuniões 1-on-1, baseadas no projeto [VGraupera/1on1-questions](https://github.com/VGraupera/1on1-questions), porém focadas no contexto nacional.

## O que são reuniões 1-on-1?

Reuniões 1-on-1 são antes de mais nada uma reunião de alinhamento entre duas pessoas.

Baseado na minha experiência atual, as reuniões de 1-on-1 são feitas com periodicidade regular e abordam diferentes questões importantes (pessoais e/ou profissionais) que tendem a melhorar a comunicação entre duas pessoas (geralmente liderança e individuo liderado).

Hoje julgo 1-on-1's como sendo uma parte indispensável na cotidiano dos times de qualquer tamanho e segmento!

## Lista de Perguntas

<% categories.each do |category| %>
[<%= category %>](#<%= category %>)
<% end %>

<% categories.each do |category| %>
### <%= category %>

  <% questions.select { |item| item['category'] == category }.each do |item| %>
* <%= item['question'] %>
  <% end %>
<% end %>

## Autores

Daniel Vinciguerra

## Agradecimentos especiais

* Ao site [ManagersClub](https://www.managersclub.com/mega-list-of-1-on-1-meeting-questions/) pela lista
* Ao Vidal Graupera pelo [repositório](https://github.com/VGraupera/1on1-questions) e inspiração para este
* Aos meus colegas [@fernandoguedes](https://github.com/fernandoguedes) e [@alesshh](https://github.com/alesshh)
