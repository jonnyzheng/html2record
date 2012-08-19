# Html2record

This gem provide a simple way that bind html specific element to a record column

## Installation

In Gemfile add follow line:

```ruby
  gem 'html2record'
```

##  Get Start

init parser file
```
rails g parser Good
```

this command will generate a parser into folder app/parsers/

```ruby
class TaobaoParser < Html2record::Parser::Base
end
```

you can add column binding in class

```ruby
class TaobaoParser < Html2record::Parser::Base
	add :title, '#main .title'	
end
```

In model file include the class 

```ruby
include Html2record::ActiveRecord
```

Use the model:

```ruby
 html =<<-page
     <html>
       <body>
         <div id="main">
           <div><span class="title">hello</span></div>
           <div><span class="content">world</span></div>
         </div>
       <body>
     </html>
 page

 good = Good.new 
 good.apply_html(Taobao,html) # good.title should be 'hello'
```









This project rocks and uses MIT-LICENSE.
