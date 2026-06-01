if (room == rResults) {
draw_set_halign(fa_center); // Centraliza o texto
    
    draw_text(room_width / 2, 100, "RETORNO À SUPERFÍCIE!");
    draw_text(room_width / 2, 150, "Status: " + string(global.return_reason));
    draw_text(room_width / 2, 200, "Coletado na Run: $" + string(global.money_collected));
    draw_text(room_width / 2, 250, "Total Ganho (com taxas): $" + string(global.money_final));
    
    draw_set_halign(fa_left); // Reseta o alinhamento padrão
}