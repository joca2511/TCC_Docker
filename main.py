import pygame

pygame.init()
screen = pygame.display.set_mode((500, 500))
clock = pygame.time.Clock()

cols, rows = 3, 3
cell_size = 100
thickness = 10
offset = 50

# Define colors as variables
COLOR_BG = (30, 30, 30)
COLOR_EDGE_DEFAULT = (100, 200, 255)
COLOR_EDGE_SELECTED = (255, 100, 100)
COLOR_DOT = (200, 200, 200)

# Horizontal edges (between rows)
horizontal_edges = []
for y in range(rows + 1):
    row = []
    for x in range(cols):
        rect = pygame.Rect(
            offset + x * cell_size,
            offset + y * cell_size - thickness // 2,  # center on horizontal grid line
            cell_size,
            thickness
        )
        row.append({"rect": rect, "selected": False})
    horizontal_edges.append(row)

# Vertical edges (between columns)
vertical_edges = []
for y in range(rows):
    row = []
    for x in range(cols + 1):
        rect = pygame.Rect(
            offset + x * cell_size - thickness // 2,  # center on vertical grid line
            offset + y * cell_size,
            thickness,
            cell_size
        )
        row.append({"rect": rect, "selected": False})
    vertical_edges.append(row)

running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

        elif event.type == pygame.MOUSEBUTTONDOWN:
            mouse_pos = pygame.mouse.get_pos()

            # Check horizontal edges
            for row in horizontal_edges:
                for edge in row:
                    if edge["rect"].collidepoint(mouse_pos):
                        edge["selected"] = not edge["selected"]

            # Check vertical edges
            for row in vertical_edges:
                for edge in row:
                    if edge["rect"].collidepoint(mouse_pos):
                        edge["selected"] = not edge["selected"]

    screen.fill(COLOR_BG)

    # Draw horizontal edges
    for row in horizontal_edges:
        for edge in row:
            color = COLOR_EDGE_SELECTED if edge["selected"] else COLOR_EDGE_DEFAULT
            pygame.draw.rect(screen, color, edge["rect"])

    # Draw vertical edges
    for row in vertical_edges:
        for edge in row:
            color = COLOR_EDGE_SELECTED if edge["selected"] else COLOR_EDGE_DEFAULT
            pygame.draw.rect(screen, color, edge["rect"])

    # Draw dots at intersections
    dot_radius = 5
    for y in range(rows + 1):
        for x in range(cols + 1):
            px = offset + x * cell_size
            py = offset + y * cell_size
            pygame.draw.circle(screen, COLOR_DOT, (px, py), dot_radius)

    pygame.display.flip()
    clock.tick(60)

pygame.quit()
