function love.load()
    love.window.setMode(480, 480)
    love.window.setTitle("Lua Aim Trainer")

    target = {}

    target.radius = 48
    -- center position
    target.x = 240 - target.radius/2
    target.y = 240 - target.radius/2
    

    targetImage = love.graphics.newImage("target.png")
    backgroundImage = love.graphics.newImage("background.png")

    score = 0
end

function love.draw()
    love.graphics.draw(backgroundImage, 0, 0)
    love.graphics.draw(targetImage, target.x, target.y)
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        local mouseToTargetDistance = distance(x, y, target.x, target.y)
        if  mouseToTargetDistance <= target.radius then
            score = score + 1

            -- set new location for target
            target.x = math.random(0, love.graphics.getWidth() - target.radius)
            target.y = math.random(0, love.graphics.getHeight() - target.radius)
        end
    end
end

function distance(x1, y1, x2, y2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end