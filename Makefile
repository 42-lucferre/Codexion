# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lucferre <lucferre@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/11/26 23:37:59 by lucferre          #+#    #+#              #
#    Updated: 2026/11/27 00:23:19 by lucferre         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.SILENT:

NAME = push_swap
CC = cc
CFLAGS = -Wall -Werror -Wextra -Iinclude

SRC = src/main.c

OBJ = $(SRC:src/%.c=build/%.o)
HEADER = include/codexion.h

# Colors
DEF_COLOR = \033[0;39m
GRAY = \033[0;90m
RED = \033[0;91m
ORANGE = \033[0;33m
GREEN = \033[0;92m
YELLOW = \033[0;93m
BLUE = \033[0;94m
MAGENTA = \033[0;95m
CYAN = \033[0;96m
WHITE = \033[0;97m


all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) -o $(NAME)
	echo "\n$(GREEN)$(NAME) compiled! $(DEF_COLOR)\n"

build/%.o: src/%.c $(HEADER)
	mkdir -p build
	echo -n "$(YELLOW)Compiling: $< $(DEF_COLOR)"
	$(CC) $(CFLAGS) -c $< -o $@
	echo "$(GREEN)[OK] $(DEF_COLOR)"

clean:
	echo -n "$(CYAN)\nRemoving object files $(DEF_COLOR)"
	rm -f $(OBJ) *.gch
	echo "$(GREEN)[OK] $(DEF_COLOR)"

fclean: clean
	rm -rf build
	echo -n "$(RED)Removing $(NAME)... $(DEF_COLOR)"
	rm -f $(NAME)
	echo "$(GREEN)[OK] $(DEF_COLOR)"

re: fclean all

.PHONY: all clean fclean re