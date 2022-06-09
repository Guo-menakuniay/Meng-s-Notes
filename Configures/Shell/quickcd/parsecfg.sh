#!/bin/bash
# 这个脚本提供函数接口来解析、处理键值对格式的配置文件.
# 默认的配置格式为: key|value. 该脚本提供如下功能:
# 1.根据所提供的 key 获取到对应的 value.
# 2.查看配置文件的内容.
# 3.使用 vim 打开配置文件,以供编辑.
# 4.提供函数来插入一个键值对到配置文件中.
# 5.提供函数从配置文件中删除所给 key 对应的键值对.
# 上面的 | 是键名和键值之间的分隔符.脚本提供set_info_ifs()函数来设置新的值.

# 下面变量保存传入的配置文件名.
PARSECFG_filepath=""

# 定义配置文件中键名和键值的分隔符. 默认分隔符是 '|'.
# 可以调用 set_info_ifs() 函数来修改分隔符的值,指定新的分隔符.
info_ifs="|"

######## 下面函数是当前脚本实现的功能函数 ########

# 从传入的项中提取出键名,并把键名写到标准输出,以供调用者读取.
# 下面echo的内容要用双引号括起来.双引号可以避免进行路径名扩展等.
# 当所echo的内容带有 '*' 时,不加双引号的话, '*' 可能会进行路径
# 名扩展,导致输出结果发生变化. 后面的几个函数也要参照这个处理.
get_key_of_entry()
{
    local entry="$1"
    # ${param%%pattern} 表达式删除匹配的后缀,返回前面剩余的部分.
    echo "${entry%%${info_ifs}*}"
}

# 从传入的项中提取出键值,并把键值写到标准输出,以供调用者读取.
get_value_of_entry()
{
    local entry="$1"
    # ${param#pattern} 表达式删除匹配的前缀,返回后面剩余的部分.
    echo "${entry#*${info_ifs}}"
}

# 该函数根据传入的键名从 key_values 关联数组中获取对应键值.
# 如果匹配,将键值写到标准输出,调用者可以读取该标准输出来获取键值.
# 该函数把查询到的键值写入到标准输出的键值. 如果没有匹配所提供
# 键名的键值,输出会是空. 调用者需要检查该函数的输出是否为空.
get_value_by_key()
{
    # 所给的第一个参数是要查询的键名.
    local key="$1"
    # 使用键名从键值对数组中获取到键值,并输出该键值.
    echo "${key_values["${key}"]}"
}

# 根据传入的键名删除配置文件中对应该键名的行.
delete_entry_by_key()
{
    # 所给的第一个参数是要删除的键名,会删除对应的键值对.
    local key="$1"
    # 这里要在${key}的前面加上^,要求${key}必须在行首.
    sed -i "/^${key}|/d" "${PARSECFG_filepath}"
    # 将关联数组中被删除键名对应的键值设成空.
    # key_values["${key}"]=""
    # 将键值设成空,这个键名还是存在于数组中.可以用 unset name[subscript]
    # 命令移除指定下标的数组元素.移除之后,这个数组元素在数组中已经不存在.
    # 注意用双引号把整个数组元素括起来. unset 命令后面的参数会进行路径名
    # 扩展.例如提供key_values[s]参数,如果当前目录下有一个key_valuess文件,
    # 那么key_values[s]会对应 key_valuess,而不是对应数组下标为s的数组元素.
    # 为了避免这个问题,使用双引号把整个数组元素括起来,不进行路径名扩展.
    unset "key_values[${key}]"
}

# 根据传入的键名,删除它在配置文件中对应的行
delete_key_value()
{
    if [ $# -ne 1 ]; then
        echo "Usage: $FUNCNAME key_name"
        return 1
    fi
    local key="$1"

    # 如果所给的键名在配置文件中已经存在,get_value_by_key()函数输出
    # 的内容不为空. 判断该函数的输出内容,不为空时才进行删除.
    local value=$(get_value_by_key "${key}")
    if test -n "${value}"; then
        delete_entry_by_key "${key}"
    else
        echo "出错: 找不到路径简写 '${key}' 对应的行"
    fi
}

# 该函数先从传入的键值对中解析出键名,然后执行get_value_by_key()
# 函数来判断该键名是否已经在配置文件中,如果在,就删除该键名对应的行.
# 最终,新传入的键值对会被追加到配置文件的末尾.
append_key_value()
{
    if [ $# -ne 1 ]; then
        echo "Usage: $FUNCNAME key_value"
        return 1
    fi
    # 所给的第一个参数是完整的键值对.
    local full_entry="$1"

    # 从传入的键值对中解析出键名
    local key_name=$(get_key_of_entry "${full_entry}")
    # 从配置文件中获取该键名对应的值.如果能够获取到值,表示该键名已经存在
    # 于配置文件中,会先删除这个键值对,再追加新传入的键值对到配置文件末尾.
    local match_value=$(get_value_by_key "${key_name}")
    if test -n "${match_value}"; then
        echo "更新 ${key_name}${info_ifs}${match_value} 为: ${full_entry}"
        delete_entry_by_key "${key_name}"
    fi

    # 追加新的键值对到配置文件末尾
    echo "${full_entry}" >> "${PARSECFG_filepath}"
    # 将新项的键名和键值添加到 key_values 数组中,以便实时反应这个修改.
    key_values["${key_name}"]="$(get_value_of_entry "${full_entry}")"
}

# 使用 cat 命令将配置文件的内容打印到标准输出上.
show_config_file()
{
    echo "所传入配置文件的内容为:"
    cat "${PARSECFG_filepath}"
}

# 打印从配置文件中解析得到的键值对.
show_key_values()
{
    local key_name
    # ${!array[@]} 对应关联数组的所有键. ${array[@]}对应关联数组的所有值.
    # 下面先获取关联数组的键,再通过键名来获取键值,并把键名和键值都打印出来.
    for key_name in "${!key_values[@]}"; do
        printf "key='\e[32m${key_name}\e[0m' \t"
        printf "value='\e[33m${key_values["${key_name}"]}\e[0m'\n"
    done
}

# 使用 vim 打开配置文件,以供编辑. 注意: 使用vim编辑文件后,文件所发生的改动不能
# 实时在脚本中反应出来,需要再次执行脚本,重新读取配置文件才能获取到所作的修改.
# 为了避免这个问题,在退出编辑后,主动调用open_config_file函数,重新解析配置文件.
edit_config_file()
{
    vim "${PARSECFG_filepath}"
    # 调用 open_config_file() 函数解析配置文件,重新为 key_values 赋值.
    open_config_file "${PARSECFG_filepath}"
}

# 在配置文件中查找指定的内容,看该内容是否在配置文件中.
search_value_from_file()
{
    # 如果查找到匹配的内容,grep命令会打印匹配的内容输出,以便查看.
    grep "$1" "${PARSECFG_filepath}"
    if [ $? -ne 0 ]; then
        echo "配置文件中不包含所给的 '$1'"
        return 1
    fi
}

######## 下面函数是初始化时需要调用的函数 ########

# 该函数用于设置配置文件中键名和键值的分隔符.
# 所给的第一个参数会指定新的分隔符,并覆盖之前设置的分隔符.
set_info_ifs()
{
    if [ $# -ne 1 ]; then
        echo "Usage: $FUNCNAME separator"
        return 1
    fi

    if [ -n "${PARSECFG_filepath}" ]; then
        # 如果配置文件名不为空,说明之前已经解析过配置文件.
        # 那么之前解析文件没有使用新的分隔符,报错返回.需要
        # 调用者修改代码,先调用当前函数,再调用open_config_file()
        # 函数,以便使用新指定的分隔符来解析配置文件的内容.
        echo "出错: 设置分隔符要先调用 set_info_ifs,再调用 open_config_file."
        return 2
    fi

    info_ifs="$1"
}

# 读取配置文件,并将配置文件的内容保存到关联数组中. 每次解析配置文件
# 之前,都要先调用该函数.后续直接通过关联数组来获取对应的值,不再多次
# 打开文件. 该函数接收一个参数,指定要解析的配置文件路径名.
open_config_file()
{
    if [ $# -ne 1 ]; then
        echo "Usage: $FUNCNAME config_filename"
        return 1
    fi

    # 判断所给的配置文件是否存在,且是否是文本文件.
    if [ ! -f "${1}" ]; then
        echo "ERROR: the file '${1}' does not exist"
        return 2
    fi
    # 存在配置文件,则把文件路径名保存到 PARSECFG_filepath 变量.
    # 使用 readlink -f 命令获取文件的绝对路径,包括文件名自身.
    # 一般来说,所给的文件名是相对路径.后续 cd 到其他目录后,用
    # 所给的相对路径会找不到这个文件, -l 选项无法查看文件内容.
    PARSECFG_filepath="$(readlink -f $1)"
    # 定义一个关联数组,保存配置文件中的键值对. 要先重置key_values的定义,
    # 避免通过 source 命令调用该脚本时, key_values 所保存的值没有被清空,
    # 造成混乱. 在函数内使用 declare 声明变量,默认是局部变量,跟 local
    # 命令类似. 使用 declare -g 可以在函数内声明变量为全局变量.
    unset key_values
    declare -g -A key_values

    local key value entryline

    # 逐行读取配置文件,并从每一行中解析出键名和键值,保存到关联数组
    # key_values中.后续直接通过键名来获取键值.如果键名不存在,键值为空.
    while read entryline; do
        # 由于配置文件的键值中可能带有空格,下面的${entryline}要用双引号
        # 括起来,避免带有空格时,本想传入一个参数,却被分割成了多个参数.
        # 例如${entryline}是service list,在不加引号时,get_value_of_entry()
        # 函数会接收到两个参数,第一个参数是$1,对应service,第二个参数是$2,
        # 对应list,而get_value_of_entry()函数只获取了第一个参数的值,这样就
        # 会处理出错.在传递变量值给函数时,变量值一定要用双引号括起来.
        key=$(get_key_of_entry "${entryline}")
        value=$(get_value_of_entry "${entryline}")
        # 经过验证,当 key_values[] 后面跟着等号'='时,所给的[]不会进行
        # 路径名扩展,不需要像上面用 unset 命令移除数组元素那样用双引号
        # 把整个数组元素括起来以避免路径名扩展.
        key_values["${key}"]="${value}"
        # 下面是预留的调试语句.在调试的时候,可以打开下面的注释.
        # echo "entryline=${entryline}"
        # echo "key=${key}"
        # echo "value=${value}"
    done < "${PARSECFG_filepath}"
    # 查看关联数组 key_values 的值.调试的时候,可以打开下面的注释.
    # declare -p key_values
}

# 操作配置文件的功能选项.建议外部调用者通过功能选项来指定要进行的操作.
# 该函数最多接收两个参数:
#   第一个参数: 提供选项名,该选项名要求以'-'开头,才是合法选项.
#   第二个参数: 提供选项的参数. 部分选项后面需要跟着一个参数.
# 当传入的选项被handle_config_option()函数处理时,该函数返回处理后的状态码.
# 例如,处理成功返回0,失败返回非0. 当传入的选项不被该函数处理时,它返回127.
handle_config_option()
{
    if [ -z "${PARSECFG_filepath}" ]; then
        # 如果配置文件变量值为空,说明还没有解析配置文件,不能往下处理.
        echo "出错: 请先调用 open_config_file filename 来解析配置文件."
        return 1
    fi
    local option="$1"
    local argument="$2"

    case "${option}" in
        -l) show_config_file ;;
        -v) show_key_values ;;
        -i) search_value_from_file "${argument}" ;;
        -e) edit_config_file ;;
        -a) append_key_value "${argument}" ;;
        -d) delete_key_value "${argument}" ;;
         *) return 127 ;;
    esac

    # 当return语句不加上具体状态码时,它会返回上一条执行命令的状态码.
    return
}
