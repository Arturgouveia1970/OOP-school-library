require './app'

def main
  app = Apps.new
  app.load_data
  app.greet
end

main
