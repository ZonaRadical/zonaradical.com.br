# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Add Roles
Role.find_or_create_by(:name => 'admin')
Role.find_or_create_by(:name => 'editor')
Role.find_or_create_by(:name => 'athlete')
Role.find_or_create_by(:name => 'agency')
Role.find_or_create_by(:name => 'organization')

# Add Tour Style
TourStyle.find_or_create_by(:name => 'Tudo misto',:description => 'Um pouco de tudo sem fanatismo')
TourStyle.find_or_create_by(:name => 'Esporte Puro',:description => 'Pura radicalização de snowboard. Sem pensar em algo a mais')
TourStyle.find_or_create_by(:name => 'Só passeio',:description => 'Uma viagem tranquila aproveitando a beleza do mundo')

# Add resort category
ResortCategory.create!([
                         {name: "Austria", description: "<p>O pais muito popular&nbsp;entre skiadores &nbsp;- o pre&ccedil;o/beneficio provavelmente &eacute; o melhor entre os paises em Alpes.</p>", ancestry: "3", index: nil, ancestry_depth: 1, image: nil, slug: nil},
                         {name: "Finlandia", description: "<p>A terra de Papai Noel e muita neve!</p>", ancestry: "3", index: nil, ancestry_depth: 1, image: nil, slug: nil},
                         {name: "Italia", description: "<p>best country, <em>low</em> prices</p>", ancestry: "3", index: nil, ancestry_depth: 1, image: nil, slug: nil},
                         {name: "França", description: "<p>Este pais europeu incorpora a parte mais alta e mais interessante dos Alpes - o massivo montanhes mais importante do mundo.</p>", ancestry: "3", index: nil, ancestry_depth: 1, image: nil, slug: nil},
                         {name: "Zillertal Valley", description: "<p>Mayerhofen and around: Fugen, Hochfugen, Kaltenbach, Zell am Ziller, Gerlos, Konigsleiten and Hintertux.</p>", ancestry: "3/11", index: nil, ancestry_depth: 2, image: nil, slug: nil},
                         {name: "Brasil", description: "<p>Bom galera, como estamos falando de um esporte de inverno e aqui no Brasil n&atilde;o temos neve (o que dificulta s&oacute; um poquinho kkkk) vamos falar dos lugares mais proximos para se ter o contato com o snowboard - vc encontra no Chile e Argentina,.... e tbm aki no Brasil.</p>\n<p>Primeramente, tem dois esportes, q na parte tecnica dao a experiencia muita parecida ao snowboarding - o sandboarding e wakeboard. Os dois tao crescendo muito no ultimos anos e um outro dia a gente faca um site sobre estes dois. Mas por enquanto procurem pela internete <a href=\"https://duckduckgo.com/?q=sandboarding+brasil\">https://duckduckgo.com/?q=sandboarding+brasil</a>, <a href=\"https://duckduckgo.com/?q=wakeboard+brasil\">https://duckduckgo.com/?q=wakeboard+brasil</a>.</p>\n<p>Alem disso, tem dois lugares aki no Brasil especializados em esportes de neve e onde vc pode obter a primeira nocao de como q eh andar de snowboard - uma pista de gramado artificial, e uma pista &ldquo;indoors&rdquo; com a neve fabricada. Nestes lugares vc pode experimentar a parte tecnica de snowboarding - de manter equilibrio, de controlar a prancha, etc. etc. Mas lembra uma descida real - na montanha, - te oferece tbm uma sensacao extremamente especial de contato com a natureza e a vusial impressionante que voce encontra exclusivamente nas montanhas e nunca encontrara em lugares aritificias.&nbsp;</p>", ancestry: "1", index: nil, ancestry_depth: 1, image: nil, slug: nil},
                         {name: "Arlberg", description: "<p>Mais uma vale maravilhosa em Tyrol, Austria.</p>", ancestry: "3/11", index: nil, ancestry_depth: 2, image: nil, slug: nil},
                         {name: "Hemisfério Norte", description: "<p>Todas as esta&ccedil;&otilde;es no outro lado do mundo.</p>\n<p>Mas como tem milhares delas, primeiramente, publicamos s&oacute; aquelas pra onde as agencias do Brasil oferecem pacotes.</p>", ancestry: nil, index: nil, ancestry_depth: 0, image: nil, slug: "hemisferio-norte"},
                         {name: "Chile", description: "<p>A lista completa das estações de ski do Chile apresentada aqui inclui muitos lugares quase desconhecidos no Brasil. Confira e escolha a melhor estação para você.&nbsp;</p><p>Chile e um pais muito legal com montanhas bem interessantes e muitas atrações turísticas. Infelizmente não tem o mercado paralelo de câmbio que deixa as coisas relativamente caras.</p>", ancestry: "1", index: nil, ancestry_depth: 1, image: "chile.png", slug: "chile"},
                         {name: "Noruega", description: "<p>A casa de Papai Noel &eacute; ali, neste&nbsp;pais de neve e montanhas.&nbsp;</p>", ancestry: "3", index: nil, ancestry_depth: 1, image: nil, slug: nil},
                         {name: "EUA", description: "<p>A terra-m&atilde;e de snowboarding, uma variedade enorme tanto de montanhas quanto de atracoes turisticas.</p>", ancestry: "3", index: nil, ancestry_depth: 1, image: nil, slug: nil},
                         {name: "Costa Oeste", description: "<p class=\"fr-tag\"><span>Incluímos&nbsp;aqui as&nbsp;estações&nbsp;de ski dos estados&nbsp;oeste&nbsp;dos EUA,&nbsp;primeiramente Colorado e&nbsp;Califórnia.&nbsp;</span></p>", ancestry: "3/9", index: nil, ancestry_depth: 2, image: nil, slug: nil},
                         {name: "Canada", description: "<p class=\"fr-tag\"><span>Um dois&nbsp;países bem&nbsp;distantes do Brasil, mas com estações de ski sensacionais!&nbsp;</span></p>", ancestry: "3", index: nil, ancestry_depth: 1, image: nil, slug: nil},
                         {name: "Argentina", description: "<p>Montanhas perfeitas, pre&ccedil;os baixos (depois de aproveitar o cambio de \"dolar azul\"), mas ... o servi&ccedil;o &eacute; de jeito argentino!</p>", ancestry: "1", index: nil, ancestry_depth: 1, image: "argentina.png", slug: nil},
                         {name: "Hemisfério Sul", description: "<p>Bom galera, quando falamos em <strong>praticar snowboard</strong>, a primeira coisa que imaginamos &eacute; o montante de dinheiro que iremos gastar na viagem, por&eacute;m n&atilde;o &eacute; bem assim.... abaixo, apresentamos alguns lugares para a pr&aacute;tica do snow desde pistas artificiais at&eacute; os melhores lugares da Am&eacute;rica do Sul.</p>", ancestry: nil, index: nil, ancestry_depth: 0, image: nil, slug: "hemisferio-sul"}
                       ])
