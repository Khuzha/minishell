NAME = minishell.out
SRCS = engine/main.c engine/utils/middlewares.c engine/utils/path_finder.c \
	parser/double_link_lst.c parser/pars_list_utils.c \
    parser/parse_main.c parser/string_end.c parser/quotes_release.c parser/screen_chars.c \
    parser/get_var_mean.c parser/general_utils.c parser/split_out_quotes.c parser/deviding.c \
    parser/deviding_utils.c

SRCOBJS = $(SRCS:.c=.o)
CC = gcc
# CFLAGS = -Wall -Wextra -Werror

$(NAME): $(SRCOBJS) headers/*.h
		make -C batyr_libft
		ar -rcs $(NAME) $(SRCOBJS) 
		gcc $(NAME) -ltermcap -lreadline batyr_libft/libft.a

all: $(NAME)

clean :
				rm -rf $(SRCOBJS) 
				make -C libft/ clean

fclean : clean
				make -C libft/ fclean
				rm -rf $(NAME)

re :  fclean all 

d:
		gcc -Wall -Wextra -Werror -g printf.c atoi.c print_d.c

t: fclean all
		gcc -Wall -Wextra -Werror -g main.c libftprintf.a

f: fclean all
		gcc -Wall -Wextra -Werror -g -fsanitize=address main.c libftprintf.a

w: fclean all
		gcc -g main.c libftprintf.a

dbg: fclean
		gcc -g main.c $(SRCS) libft/ft_itoa.c libft/ft_atoi.c libft/ft_strlen.c libft/ft_substr.c libft/ft_isdigit.c libft/ft_memcpy.c libft/ft_memset.c libft/ft_putchar_fd.c libft/ft_putstr_fd.c libft/ft_strdup.c