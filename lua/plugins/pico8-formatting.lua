return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      pico8 = { "pico8_formatter" },
    },
    formatters = {
      pico8_formatter = {
        command = "sh",
        args = {
          "-c",
          [[
            file=$(cat)

            # Extract the three parts
            header=$(echo "$file" | awk '/^__lua__$/{exit} {print}')
            code=$(echo "$file" | awk '/^__lua__$/{flag=1; next} /^__gfx__|^__gff__|^__label__|^__map__|^__sfx__|^__music__/{flag=0} flag')
            data=$(echo "$file" | awk '/^__gfx__|^__gff__|^__label__|^__map__|^__sfx__|^__music__/{found=1} found')

            # Replace PICO-8 special chars with temporary placeholders
            temp_code=$(echo "$code" | sed 's/❎/__BTN_X__/g; s/🅾️/__BTN_O__/g; s/⬆️/__BTN_UP__/g; s/⬇️/__BTN_DOWN__/g; s/⬅️/__BTN_LEFT__/g; s/➡️/__BTN_RIGHT__/g')

            # Format the code
            formatted_code=$(echo "$temp_code" | stylua --indent-width 2 --indent-type Spaces - 2>/dev/null)

            # If formatting succeeded, restore the special chars
            if [ -n "$formatted_code" ]; then
              formatted_code=$(echo "$formatted_code" | sed 's/__BTN_X__/❎/g; s/__BTN_O__/🅾️/g; s/__BTN_UP__/⬆️/g; s/__BTN_DOWN__/⬇️/g; s/__BTN_LEFT__/⬅️/g; s/__BTN_RIGHT__/➡️/g')
            else
              # Fallback to original if still failing
              formatted_code="$code"
            fi

            # Output everything with conditional blank line
            echo "$header"
            echo "__lua__"
            
            # Only add blank line if code doesn't start with one
            if [ -n "$formatted_code" ] && [ "$(echo "$formatted_code" | head -n1)" != "" ]; then
              echo ""  # Blank line after __lua__ only if needed
            fi
            
            echo "$formatted_code"
            if [ -n "$data" ]; then
              echo ""  # Blank line before data sections
              echo "$data"
            fi
          ]],
        },
        stdin = true,
      },
    },
  },
}
